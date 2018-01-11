//
//  String+Utils.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

extension String {
    func words() -> [String] {
        var words = [String]()
        self.enumerateSubstrings(in: self.startIndex ..< self.endIndex, options: .byWords) {(substring, _, _, _) -> () in
            if let string = substring {
                words.append(string)
            }
        }
        return words
    }
}
