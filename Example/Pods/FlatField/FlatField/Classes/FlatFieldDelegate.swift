//
//  FlatFieldDelegate.swift
//  FlatField
//
//  Created by Ampe on 7/28/18.
//

import UIKit

public protocol FloatingLabelDelegate {
    func editingBegan(_ sender: FlatField)
    func textChanged(_ sender: FlatField)
}
