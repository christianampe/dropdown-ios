//
//  SchoolViewController.swift
//  FlatDropdown_Example
//
//  Created by Ampe on 7/31/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import FlatField
import FlatDropdown

class SchoolViewController: UIViewController {
    var data: [[String]] = [[]]
    
    @IBOutlet weak var flatDropdown: FlatDropdown!
}

extension SchoolViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flatDropdown.delegate = self
        flatDropdown.dataSource = self
        
        flatDropdown.tableView.separatorStyle = .none
    }
}

extension SchoolViewController: FlatDropdownDataSource {}

extension SchoolViewController: FlatDropdownDelegate {
    func didBeginEditing(_ sender: FlatField) {
        // do nothing
    }
    
    func textDidChange(_ sender: FlatField) {
        guard let text = sender.textField.text else {
            
            return
        }
        
        requestSchoolAutocomplete(with: text)
    }
    
    func didEndEditing(_ sender: FlatField) {
        // do nothing
    }
    
    func didSelectRow(_ at: IndexPath, _ sender: FlatDropdown) {
        flatDropdown.flatField.text = data[at.section][at.row]
    }
}

extension SchoolViewController {
    func requestSchoolAutocomplete(with text: String) {
        Autocomplete.schoolName(with: text) { [weak self] (response) in
            
            guard let autocomplete = response else {
                
                return // response not provided
            }
            
            let schoolNames = autocomplete.schools.map { $0.name.lowercased() }
            
            self?.data[0] = schoolNames
            self?.flatDropdown.tableView.reloadData()
        }
    }
}
