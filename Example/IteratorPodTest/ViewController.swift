//
//  ViewController.swift
//  IteratorPodTest
//
//  Created by mjjimenez on 11/13/2022.
//  Copyright (c) 2022 mjjimenez. All rights reserved.
//

import UIKit
import IteratorPodTest

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let data: [([Float], [Float])] = [
            ([1,2,3,4,5],[1]),
            ([6,7,8,9,10],[0]),
            ([11,12,13,14,15],[1]),
            ([16,17,18,19,20],[0])
        ]

        let arrIterator = ArrayIteratorWrapper(data: data)

        testIterator(dataLoader: arrIterator)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

