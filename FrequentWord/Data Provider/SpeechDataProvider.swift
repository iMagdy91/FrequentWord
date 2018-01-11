//
//  SpeechDataProvider.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import Foundation

fileprivate let jsonFileName        : String = "speeches"

@objc protocol SpeechDataSource{
    func didReceiveRestaurantData(_ data: Any)
    func didFailToReadData(_ error: Error)
}

class RestaurantDataProvider {
    
    //MARK: - Properties
    weak var delegate: SpeechDataSource? {
        didSet {
            readJsonDataFromFile()
        }
    }
    
    //MARK: - Private Methods
    private func readJsonDataFromFile() {
        if let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                delegate?.didReceiveRestaurantData(jsonResult)
            }
            catch {
                delegate?.didFailToReadData(error)
            }
        }
    }
    
}
