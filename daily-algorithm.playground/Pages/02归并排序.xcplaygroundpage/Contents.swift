//: [Previous](@previous)

import Foundation
import UIKit


let ms = UIImage(named: "ms.jpg")


/*
 分：把数组分成两半，再递归对子数组进行分操作，直至到一个个单独数字
 合：把两个数合成有序数组，再对有序数组进行合并操作，直到全部子数组合成一个完整的数组
 合并操作可以新建一个数组，用于存放排序后的数组
 比较两个有序数组的头部，较小者出队并且推入到上述新建的数组中
 如果两个数组还有值，则重复上述第二步
 如果只有一个数组有值，则将该数组的值出队并推入到上述新建的数组中
 */

// 应用场景
// 处理超过内存限度的数据

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let middle = array.count / 2
    
    let left = mergeSort(Array(array[0..<middle]))
    let right = mergeSort(Array(array[middle..<array.count]))
    return merge(left, right)
}


func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var res: [Int] = []
    res.reserveCapacity(left.count + right.count)
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            res.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            res.append(right[rightIndex])
            rightIndex += 1
        } else {
            res.append(left[leftIndex])
            res.append(right[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        res.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        res.append(right[rightIndex])
        rightIndex += 1
    }
    
    return res
}


let arr = [12, 33, 11, 34, 5, 24, 34, 25, 45, 4, 66, 56, 55]
let sorted = mergeSort(arr)
print(sorted)

//: [Next](@next)
