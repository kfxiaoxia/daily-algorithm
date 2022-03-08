//: [Previous](@previous)

import Foundation
import UIKit
import XCTest

/*:
 二分法查找
 
 在有序数组中查找某一特定元素的搜索算法
 
 逻辑：
 
 左右两个指针，取中间的值；中间的值大于左边，左指针右移；中间的值于小右边的值，右边的指针向左移动
 
 */
let bs = UIImage(named: "Binary_search_into_array")



func binarySearch(_ nums: [Int], target: Int) -> Int? {
    if nums.isEmpty {
        return nil
    }
    
    var left = 0, right = nums.count - 1
    
    while left <= right {
        let lv = nums[left]
        let rv = nums[right]
        let mid = (right - left) / 2 + left
        let mv = nums[mid]
        if lv < mv {
            left = mid + 1
        } else if lv > rv {
            right = mid - 1
        } else {
            return mid
        }
        
    }
    
    return nil
}

let a: [Int] = []
let ar = binarySearch(a, target: 0)
print("ar = \(ar)")

let b: [Int] = [1]
let br1 = binarySearch(b, target: 1)
print("br1 = \(br1)")
let br2 = binarySearch(b, target: 9)
print("br2 = \(br2)")

let c: [Int] = [1, 2, 5, 7, 9]
let cr = binarySearch(c, target: 5)
print("cr = \(cr)")



//: [Next](@next)
