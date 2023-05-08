import UIKit

//var greeting = "Hello, playground"
//
//// write a method take array as paremetr and return second larget number from array find second max
//
func secondMax(data: [Int]) {
    var firstMax = Int.min
    var secondMax = Int.min

    for itr in 0..<data.count {
        if data[itr] > firstMax {
            secondMax = firstMax
            firstMax = data[itr]
        } else if data[itr] > secondMax {
            secondMax = data[itr]
        }
    }

    print(secondMax)
}

let arr3 = [0,-1,-2,-3,-4,-5]
secondMax(data: arr3)
//
//
//
//Here's the Swift code equivalent of the Python code you provided:
//
//```swift
func secondLargest(seq: [Int]) -> Int {
    var largest = Int.min
    var secondLargest = Int.min
    
    for elt in seq {
        if elt > largest {
            secondLargest = largest
            largest = elt
        } else if elt > secondLargest {
            secondLargest = elt
        }
    }
    
    return secondLargest
}

let arr1 = [-3, 3, -3, 3]
print(secondLargest(seq: arr1)) // prints 3

let arr2 = [0,-3, -4, -5, -1]
print(secondLargest(seq: arr2)) // prints -3
