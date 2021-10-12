//
//  Permutation.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 12/10/21.
//

import Foundation

class Permutation{
    private func removeSmallestMember(ofSpares spares: inout [Int]) -> Int? {
        if spares.count > 0 {
            let smallest = spares[0]
            spares.remove(at: 0)
            return smallest
        } else {
            return nil
        }
    }
    private func removeSmallestMember(ofSpares spares: inout [Int], greaterThan value: Int) -> Int? {
        for r in 0..<spares.count {
            let p = spares[r]
            if value < p {
                spares.remove(at: r)
                return p
            }
        }
        return nil
    }
    private func insertAscending(to spares: inout [Int], value: Int) {
        guard let last = spares.last else {
            spares.insert(value, at: 0)
            return
        }
        guard  value < last else {
            spares.append(value)
            return
        }
        for s in (0..<spares.count) {
            if s == 0 && value < spares[s] { // value is less than the first item
                spares.insert(value, at: 0)
                break
            }
            if s == spares.count - 1 && value > spares[s] { //value is more than the last item
                spares.append(value)
                break
            }
            if spares[s] < value && value < spares[s + 1] { // value is between two subsiquent items
                spares.insert(value, at: s + 1)
                break
            }
        }
    }
    private func permuteNext(a: [Int], spares: [Int]) -> ([Int], [Int])? {
        var a = a
        var spares = spares
        for i in (0..<a.count).reversed() {
            let m = a[i]
            if let smallerSpare = removeSmallestMember(ofSpares: &spares, greaterThan: m) {
                a[i] = smallerSpare
                insertAscending(to: &spares, value: m)
                for k in (i + 1)..<a.count {
                    let p = a[k]
                    if let smallestSpare = removeSmallestMember(ofSpares: &spares) {
                        a[k] = smallestSpare
                        insertAscending(to: &spares, value: p)
                    } else {
                        break
                    }
                }
                return (a, spares)
            } else { //There is no smaller member in spares for this item
                if i >= 1 && m > a[i - 1] {
                    let n = a[i - 1]
                    for j in i ..< a.count {
                        insertAscending(to: &spares, value: a[j])
                    }
                    if let smallest = removeSmallestMember(ofSpares: &spares, greaterThan: a[i - 1]) {
                        a[i - 1] = smallest
                        insertAscending(to: &spares, value: n)
                    }
                    for k in i..<a.count {
                        if let smallestSpare = removeSmallestMember(ofSpares: &spares) {
                            a[k] = smallestSpare
                        } else {
                            break
                        }
                    }
                    return (a, spares)
                }
            }
        }
        return nil
    }
    public func permute(n: Int, r: Int) -> [[Int]] {
        guard r <= n else {
            return [[Int]]()
        }
        var source     = [Int]()
        var spares    = [Int]()
        for i in 1...r {
            source.append(i)
        }
        if r < n {
            for j in (r + 1)...n {
                spares.append(j)
            }
        }
        var result = [source]
        while let next = permuteNext(a: source, spares: spares) {
            source = next.0
            spares = next.1
            result.append(source)
        }
        return result
    }
}

