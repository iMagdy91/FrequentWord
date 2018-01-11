//
//  SpeechViewController.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

class SpeechViewController: BaseViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var speechTextView: UITextView!
    @IBOutlet weak var frequentWordLabel: UILabel!
    
    
    //MARK: - Properties
    var speaker: Speaker?
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateMostFrequentWord()
    }
    override func setupView() {
        super.setupView()
        title = speaker?.name
        speechTextView.text = speaker?.speech
    }


    //MARK: - Private Methods
    private func calculateMostFrequentWord() {
        speechStore.getMostFrequentWordFromText(speaker?.speech) {[weak self] (mostFrequentString) in
            self?.frequentWordLabel.text = "Most frequent word : \(mostFrequentString)"
        }
    }
    
}
