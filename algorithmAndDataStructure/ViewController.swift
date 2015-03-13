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
//        quickSort(&dataList, left: 0, right: dataList.count - 1)
//        println(dataList)
        binaryInsertSort(&dataList)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //quick sort with one parameter
    func quickSort(inout arr: [Int]) -> [Int] {
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
        return quickSort(&left) + [pivot] + quickSort(&right)
    }
    
    //quick sort with partition func
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
    
    //quick sort with filter
    func quickSortWithFilter(var arr: [Int]) -> [Int] {
        if arr.count <= 1 { return arr}
        let pivot = arr.removeAtIndex(0)
        var left = arr.filter { $0 < pivot }
        var right = arr.filter { $0 >= pivot }
        return quickSortWithFilter(left) + [pivot] + quickSortWithFilter(right)
    }
    
    //insertion sort with one parameter
    func insertSort(inout arr:[Int]) {
        if arr.count < 2 {
            return
        }
        var sortedPos = 0
        var tmp:Int, i:Int, j:Int
        for i = sortedPos + 1; i < arr.count; i++ {
            tmp = arr[i]
            j = i - 1
            while j >= 0 && arr[j] > tmp {
                arr[j + 1] = arr[j]
                j--
            }
            arr[j + 1] = tmp
        }
    }
    //binary insertion sort

    func binaryInsertSort(inout arr:[Int]) {
        if arr.count < 2 {
            return
        }
        var sortedPos = 0
        var tmp:Int, i:Int, j:Int, left:Int, right:Int, middle:Int
        for i = sortedPos + 1; i < arr.count; i++ {
            tmp = arr[i]
            left = 0
            right = i - 1
            while (left <= right) {
                middle = (left + right)/2
                if (arr[middle] > tmp) {
                    right = middle - 1
                }
                else {
                    left = middle + 1
                }
            }
            for j = i - 1; j >= left; j-- {
                arr[j+1] = arr[j]
            }
            arr[left] = tmp
            println(arr)
        }
    }
//    func insertSort(inout arr:[Int]) {
//        if arr.count < 2 {
//            return
//        }
//        var sortedPos = 0
//        var sorted = arr[sortedPos]
//        for var i = sortedPos + 1; i < arr.count; i++ {
//            for var j = 0; j < sortedPos + 1; j++ {
//                if arr[i] < arr[j] {
//                    (arr[i], arr[j]) = (arr[j], arr[i])
//                    println(arr)
//
//                }
//
//            }
//            sortedPos++
//        }
//    }
}