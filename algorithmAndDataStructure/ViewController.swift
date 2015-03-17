//
//  ViewController.swift
//  sorting
//
//  Created by Zac on 12/03/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var dataList = [42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 99, 20, 45, 91, 62, 2, 15, 31, 59, 5]
        println(dataList.count)
//        println(quicksort(&dataList))
//        quickSort(&dataList, left: 0, right: dataList.count - 1)
//        println(dataList)
//        binaryInsertionSort(&dataList)
        Sort.shellSort(&dataList)
        println(dataList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}