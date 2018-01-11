//
//  BaseStore.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

protocol BaseStore {
    typealias ErrorClosure              = (Error) -> Void
    typealias UISuccessClosure          = ([BaseModel]?) -> Void
    typealias BusinessSuccessClosure    = (BaseModel?) -> Void
    typealias MostFrequentStringClosure = (String) ->Void
    typealias ProgressClosure           = (Float) ->Void
}
