//
//  FlatDropdownCell.swift
//  FlatDropdown
//
//  Created by Ampe on 7/30/18.
//

import Foundation

public protocol FlatDropdownCell where Self: UITableViewCell {
    associatedtype Model
    
    func reloadCell(with model: Model)
}
