//
//  SpeakerTableViewCell.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

class SpeakerTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet private weak var speakerNameLabel: UILabel!
    @IBOutlet private weak var speechTimeLabel: UILabel!
    
    
    //MARK: - Cell Customization Methods
    func customizeCellWithModel(_ model: Speaker?) {
        speakerNameLabel.text = model?.name
        speechTimeLabel.text = model?.date
    }
    
}
