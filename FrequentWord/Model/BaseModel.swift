//
//  BaseModel.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseModel: Mappable {
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {
    }
}
