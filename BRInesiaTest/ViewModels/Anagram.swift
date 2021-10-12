//
//  Anagram.swift
//  BRInesiaTest
//
//  Created by Delta Rahmat Fajar Delviansyah on 12/10/21.
//

import Foundation

class Anagram {
    func isAnagram(firstString: String, secondString: String) -> Bool {
        return firstString.lowercased().sorted()==secondString.lowercased().sorted()
    }
}
