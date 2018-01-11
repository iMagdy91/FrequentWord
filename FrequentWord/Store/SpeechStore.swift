//
//  SpeechStore.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

class SpeechStore: BaseStore {
    
    //MARK: - Methods
    
    /**
     Requests and filters Doctors list near you.
     
     - Parameter completion: Callback with the result array.
     - Parameter failure: Error callback.
     
     */
    
    func getListOfSpeakers(completion success: @escaping UISuccessClosure,
                           failure: @escaping ErrorClosure) {
        let _ = SpeechDataManager(speechModelClosure: { (model) in
            if let speechModel = model as? SpeechModel {
                success(speechModel.speeches)
            }
        }, speechFailureClosure: failure)
    }
}
