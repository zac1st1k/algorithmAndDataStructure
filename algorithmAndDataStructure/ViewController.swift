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
        
        var dataList = [42, 12, 88, 62, 63, 56, 1, 77, 88, 97, 97, 20, 45, 91, 62, 2, 15, 31, 59, 5]
//        println(quicksort(&dataList))

        quickSort(&dataList, left: 0, right: dataList.count - 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func quicksort(inout arr: [Int]) -> [Int] {
        if arr.count <= 1 {
            return arr
        }
        var pivot = arr[0]
        var left:[Int] = []
        var right:[Int] = []
        for (var i = 1; i < arr.count; i++) {
            if arr[i] < pivot {
                left.append(arr[i])
            }
            else {
                right.append(arr[i])
            }
        }
        return quicksort(&left) + [pivot] + quicksort(&right)
    }
    
    func partition(inout dataList: [Int], low: Int, high: Int) -> Int {
        var pivotPos = low
        var pivot = dataList[low]
        for var i = low + 1; i <= high; i++ {
            if dataList[i] < pivot && ++pivotPos != i {
                (dataList[pivotPos], dataList[i]) = (dataList[i], dataList[pivotPos])
                println(pivotPos)
                println(i)
                println(dataList)
            }
        }
        (dataList[low], dataList[pivotPos]) = (dataList[pivotPos], dataList[low])
        return pivotPos
    }
    
    func quickSort(inout dataList: [Int], left: Int, right: Int) {
        if left < right {
            var pivotPos = partition(&dataList, low: left, high: right)
            quickSort(&dataList, left: left, right: pivotPos - 1)
            quickSort(&dataList, left: pivotPos + 1, right: right)
        }
    }
}

