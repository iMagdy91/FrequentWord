//
//  SpeakersViewController+UITableView.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit

extension SpeakersViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return speakers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return constructCellForTableView(tableView:tableView, atIndexPath:indexPath)
    }
    
    // MARK: - Cell Construction Methods
    private func constructCellForTableView(tableView: UITableView,
                                   atIndexPath indexPath: IndexPath) -> SpeakerTableViewCell {
        let cell: SpeakerTableViewCell?  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.speakerCellIdentifier) as? SpeakerTableViewCell
        
        let doctorModel = speakers?[indexPath.row]
        
        cell?.customizeCellWithModel(doctorModel)
        
        return cell!
    }
    
    //MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView,
                   estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewConstants.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueIdentifier.showSpeechSegue, sender: indexPath)
    }
}
