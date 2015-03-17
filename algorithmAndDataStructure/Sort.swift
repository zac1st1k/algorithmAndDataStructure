//
//  Sort.swift
//  algorithmAndDataStructure
//
//  Created by Zac on 17/03/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

import UIKit

class Sort: NSObject {
    
    //quick sort with one parameter
    class func quickSort(inout arr: [Int]) -> [Int] {
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
    class func partition(inout dataList: [Int], low: Int, high: Int) -> Int {
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
    
    class func quickSort(inout dataList: [Int], left: Int, right: Int) {
        if left < right {
            var pivotPos = partition(&dataList, low: left, high: right)
            quickSort(&dataList, left: left, right: pivotPos - 1)
            quickSort(&dataList, left: pivotPos + 1, right: right)
        }
    }
    
    //quick sort with filter
    class func quickSortWithFilter(var arr: [Int]) -> [Int] {
        if arr.count <= 1 { return arr}
        let pivot = arr.removeAtIndex(0)
        var left = arr.filter { $0 < pivot }
        var right = arr.filter { $0 >= pivot }
        return quickSortWithFilter(left) + [pivot] + quickSortWithFilter(right)
    }
    
    //insertion sort with one parameter
    class func insertionSort(inout arr:[Int]) {
        
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
    
    class func binaryInsertionSort(inout arr:[Int]) {
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
    
    class func selectionSort(inout arr:[Int]) {
        var min = 0
        var length = arr.count
        var i = 0
        var swap = 0, loop = 0
        for var j = 0; j < length - 1; j++ {
            for i = j + 1; i < length; i++ {
                if arr[min] > arr[i] {
                    min = i
                }
                loop++
            }
            if  min != j {
                (arr[j], arr[min]) = (arr[min], arr[j])
                swap++
            }
            min = j + 1
            loop++
        }
        println("\(swap) times swap")
        println("\(loop) times loop")
    }
    
    class func bubbleSort(inout arr:[Int]) {
        var length = arr.count
        var swap = 0
        var loop = 0
        var swapped = false
        for var i = length; i > 1 ; i-- {
            for var j = 0; j < i - 1; j++ {
                if arr[j] > arr[j + 1] {
                    (arr[j], arr[j + 1]) = (arr[j + 1], arr[j])
                    swapped = true
                    swap++
                }
                loop++
            }
            println(arr)
            loop++
            if swapped == false {
                println("break")
                break
            }
            swapped = false
        }
        println("\(swap) times swap")
        println("\(loop) times loop")
    }
    
    class func cocktailSort(inout arr:[Int]) {
        var length = arr.count
        var swap = 0
        var loop = 0
        var flag = true
        var swapped = false
        for var i = length; i > 2 ; i-- {
            if flag {
                for var j = 0; j < i - 1; j++ {
                    if arr[j] > arr[j + 1] {
                        (arr[j], arr[j + 1]) = (arr[j + 1], arr[j])
                        swap++
                        swapped = true
                    }
                    loop++
                }
            }
            else {
                for var j = i; j > 1; j-- {
                    if arr[j] < arr[j - 1] {
                        (arr[j], arr[j - 1]) = (arr[j - 1], arr[j])
                        swap++
                        swapped = true
                    }
                    loop++
                }
            }
            if swapped == false {
                break
            }
            swapped = !swapped
            flag = !flag
            println(arr)
            loop++
        }
        println("\(swap) times swap")
        println("\(loop) times loop")
    }
    
    class func shellSort(inout arr:[Int]) {
        var gap = 0, i = 0, j = 0, k = 0, tmp = 0
        var length = arr.count
        for gap = length/2; gap > 0; gap = gap/2 {
            for i = 0; i < gap; i++ {
                for j = i + gap; j < length; j += gap {
                    if arr[j] < arr[j - gap] {
                        tmp = arr[j]
                        k = j - gap
                        while k >= 0 && arr[k] > tmp {
                            arr[k + gap] = arr[k]
                            k -= gap
                        }
                        arr[k + gap] = tmp
                        println(arr)
                    }
                }
            }
        }
    }

    //    class func insertSort(inout arr:[Int]) {
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
