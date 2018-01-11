//
//  SpeechModel.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of Speech file.
class SpeechModel: BaseModel {
    
    // MARK: - Properties
    private(set) var speeches          : [Speaker]?
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        speeches           <- map["speeches"]
    }
}

class Speaker: BaseModel {
    // MARK: - Properties
    private(set) var name              : String?
    private(set) var date              : String?
    private(set) var speech            : String?
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        name                <- map["name"]
        date                <- map["date"]
        speech              <- map["speech"]
    }
}
