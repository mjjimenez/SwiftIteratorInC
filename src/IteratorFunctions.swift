
public func helloWorld() {
    print_go()
}

public class ArrayIteratorWrapper: IteratorProtocol {

    var arrayIterator: AnyIterator<([Float32], [Float32])>

    public init(data: [([Float32], [Float32])]) {
        self.arrayIterator = AnyIterator(data.makeIterator())
    }

    public func next() -> ([Float32], [Float32])? {
        return self.arrayIterator.next()
    }
}

public typealias IteratorCallback = @convention(c) (
    UnsafeMutableRawPointer?,
    UnsafeMutablePointer<Bool>?,
    UnsafeMutablePointer<Float>?,
    UnsafeMutablePointer<Float>?
) -> Void

public typealias IteratorDestructor = @convention(c) (UnsafeMutableRawPointer?) -> Void

public func testIterator(dataLoader: ArrayIteratorWrapper) -> Void {

    let context = Unmanaged.passRetained(dataLoader).toOpaque()

    let iteratorCallback: IteratorCallback = { context, iteratorEnd, trainingDataPtr, labelsPtr in

        guard let context = context else {
            print("iterator context is NULL")
            iteratorEnd?.initialize(to: true)
            return
        }

        guard let trainingDataPtr = trainingDataPtr,
              let labelsPtr = labelsPtr else
        {
            print("training and labels pointer are uninitialized")
            iteratorEnd?.initialize(to: true)
            return
        }

        let arrIterator = Unmanaged<ArrayIteratorWrapper>.fromOpaque(context).takeUnretainedValue()

        if let (trainingArray, labelsArray) = arrIterator.next() {
            trainingDataPtr.initialize(from: trainingArray, count: trainingArray.count)
            labelsPtr.initialize(from: labelsArray, count: labelsArray.count)
        } else {
            iteratorEnd?.initialize(to: true)
        }

    }

    let destructorCallback: IteratorDestructor = { context in

        guard let context = context else {
            print("iterator context is NULL")
            return
        }

        Unmanaged<ArrayIteratorWrapper>.fromOpaque(context).release()
        print("Dataloader released")
    }

    call_go_iterator(context, iteratorCallback, destructorCallback)

}
