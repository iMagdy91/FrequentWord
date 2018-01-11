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
    
    /**
     Requests and filters Doctors list near you.
     - Parameter text: required string to get the most frequent word.
     - Parameter completion: Callback with the most frequent word.
     */
    func getMostFrequentWordFromText(_ text: String?, completion success: @escaping MostFrequentStringClosure) {
        if let txt = text {
            DispatchQueue.global(qos: .background).async {
                let arrayOfStrings = txt.words()
                var timesOfOccuranceOfWord  = [String: Int]()
                
                for word in arrayOfStrings {
                    timesOfOccuranceOfWord[word] = (timesOfOccuranceOfWord[word] ?? 0) + 1
                }
                let decendingSortOfArray = timesOfOccuranceOfWord.sorted(by: ({$0.1 > $1.1}))
                DispatchQueue.main.async {
                    success(decendingSortOfArray[0].0)
                }
            }
        }
    }
}
