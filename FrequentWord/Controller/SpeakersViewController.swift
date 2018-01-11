//
//  SpeakersViewController.swift
//  FrequentWord
//
//  Created by Mohamed Magdy on 11.01.18.
//  Copyright © 2018 Mohamed. All rights reserved.
//

import UIKit
import MBProgressHUD

class SpeakersViewController: BaseViewController {

    //MARK: - Properties
    var speakers                                : [Speaker]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet private weak var tableView        : UITableView!
    
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func setupView() {
        super.setupView()
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = UITableViewConstants.estimatedRowHeight
    }
    
    //MARK: - Private Methods
    private func fetchData() {
        MBProgressHUD.showAdded(to: view, animated: true)
        speechStore.getListOfSpeakers(completion: {[weak self] (model) in
            guard let strongSelf = self else { return }
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.speakers = model as? [Speaker]
            
        }) { [weak self](error) in
            guard let strongSelf = self else { return }
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.handleError(error: error)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.showSpeechSegue {
            let speechViewController = segue.destination as? SpeechViewController
            if let indexPath = sender as? IndexPath {
                speechViewController?.speaker = speakers?[indexPath.row]
            }
        }
    }
    

}
