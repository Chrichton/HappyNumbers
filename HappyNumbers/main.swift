//
//  main.swift
//  HappyNumbers
//
//  Created by Heiko Goes on 27.02.20.
//  Copyright © 2020 Heiko Goes. All rights reserved.
//

import Foundation

func getDigits(_ number: Int) -> [Int] {
    String(number).map{ Int(String($0))! }
}

func getSumOfSquares(_ digits: [Int]) -> Int {
    digits
        .map{$0 * $0}
        .reduce(0, +)
}

func isHappyRecursive(_ number: Int, _ lastNumbers: Set<Int>) -> Bool {
    let result = getSumOfSquares(getDigits(number))
    if result == 1 {
        return true
    }
    
    if lastNumbers.contains(result) {
        return false
    }
    
    return isHappyRecursive(result, lastNumbers.union([result]))
}

func isHappy(_ number: Int) -> Bool {
    return isHappyRecursive(number, [])
}

let result = (1...20).filter(isHappy(_:))

print(result)
