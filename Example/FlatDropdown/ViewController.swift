//
//  ViewController.swift
//  FlatDropdown
//
//  Created by christianampe on 07/29/2018.
//  Copyright (c) 2018 christianampe. All rights reserved.
//

import UIKit
import FlatField
import FlatDropdown

class ViewController: UIViewController {
    var data = [["0 0", "0 1", "0 2", "0 3"],
                ["1 0", "1 1", "1 2", "1 3", "1 4"],
                ["2 0", "2 1"]]
    
    @IBOutlet weak var flatDropdown: FlatDropdown!
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flatDropdown.delegate = self
        flatDropdown.dataSource = self
        
        flatDropdown.tableView.separatorStyle = .none
    }
}

extension ViewController: FlatDropdownDataSource {
}

extension ViewController: FlatDropdownDelegate {
    func didBeginEditing(_ sender: FlatField) {
        // do nothing
    }
    
    func textDidChange(_ sender: FlatField) {
        print(sender.textField.text)
    }
    
    func didEndEditing(_ sender: FlatField) {
        // do nothing
    }
    
    func didSelectRow(_ at: IndexPath, _ sender: FlatDropdown) {
        flatDropdown.flatField.text = data[at.section][at.row]
    }
}

