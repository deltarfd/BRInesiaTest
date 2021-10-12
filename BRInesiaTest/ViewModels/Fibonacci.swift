//
//  Fibonacci.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 12/10/21.
//

import Foundation

class Fibonacci{
    func fibonacciList(_ number: Int) -> [Int]{
        var arrFibonacci = [0, 1]
        for i in 2...number {
            arrFibonacci.append(arrFibonacci[i-1]+arrFibonacci[i-2])
        }
        return arrFibonacci
    }
}
