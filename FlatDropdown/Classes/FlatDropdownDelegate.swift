//
//  FlatDropdownDelegate.swift
//  FlatDropdown
//
//  Created by Ampe on 7/30/18.
//

import Foundation

public protocol FlatDropdownDelegate {
    func didBeginEditing(_ sender: FlatDropdown)
    func textDidChange(_ sender: FlatDropdown)
    func didEndEditing(_ sender: FlatDropdown)
    
    func didSelectRow(_ at: IndexPath, _ sender: FlatDropdown)
}
