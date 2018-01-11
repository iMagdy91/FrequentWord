//
//  SpeechDataManager.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation
import ObjectMapper

class SpeechDataManager:BaseStore, SpeechDataSource {
    
    //MARK: - Properties
    private var dataSource          : RestaurantDataProvider? {
        didSet {
            dataSource?.delegate = self
        }
    }
    private var speechModelClosure  : BusinessSuccessClosure?
    private var speechFailureClosure: ErrorClosure?
    
    //MARK: - Init
    required init(speechModelClosure: @escaping BusinessSuccessClosure,
                  speechFailureClosure: @escaping ErrorClosure) {
        self.speechModelClosure     = speechModelClosure
        self.speechFailureClosure   = speechFailureClosure
        dataSource = RestaurantDataProvider()
    }
    
    //MARK: - SpeechDataSource Methods
    func didReceiveRestaurantData(_ data: Any) {
        parseDataIntoModel(data)
    }
    
    func didFailToReadData(_ error: Error) {
        speechFailureClosure?(error)
    }
    
    //MARK: - Private Methods
    private func parseDataIntoModel(_ data: Any) {
        let speechModel: SpeechModel? = Mapper<SpeechModel>().map(JSONObject: data)
        speechModelClosure?(speechModel)
    }
    
}
