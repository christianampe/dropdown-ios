//
//  FlatDropdown.swift
//  FlatDropdown
//
//  Created by Ampe on 7/30/18.
//

import FlatField

// MARK: - Class Declaration
@IBDesignable
open class FlatDropdown<Model>: UIView {
    
    // MARK: Views
    open weak var flatField: FlatField!
    open weak var tableView: UITableView!
    
    // MARK: Properties
    open weak var flatFieldHeightConstraint: NSLayoutConstraint!
    
    // MARK: IBInspectables
    @IBInspectable
    open var text: String = FlatFieldConfig.default.text {
        didSet {
            flatField.textField.text = text
        }
    }
    
    @IBInspectable
    open var placeholderText: String = FlatFieldConfig.default.placeholderText {
        didSet {
            flatField.textField.placeholder = placeholderText
        }
    }
    
    @IBInspectable
    open var cursorColor: UIColor = FlatFieldConfig.default.cursorColor {
        didSet {
            flatField.textField.tintColor = cursorColor
        }
    }
    
    @IBInspectable
    open var textColor: UIColor = FlatFieldConfig.default.textColor {
        didSet {
            flatField.textField.textColor = textColor
        }
    }
    @IBInspectable
    open var placeholderColor: UIColor = FlatFieldConfig.default.placeholderColor {
        didSet {
            flatField.textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes:[NSAttributedStringKey.foregroundColor: placeholderColor])
        }
    }
    
    @IBInspectable
    open var underlineColor: UIColor = FlatFieldConfig.default.underlineColor {
        didSet {
            flatField.underline.backgroundColor = underlineColor
        }
    }
    
    @IBInspectable
    open var underlineThickness: CGFloat = FlatFieldConfig.default.underlineThickness {
        didSet {
            flatField.underlineHeightConstraint.constant = underlineThickness
        }
    }
    
    @IBInspectable
    open var textAlignment: Int = FlatFieldConfig.default.textAlignment.rawValue {
        didSet {
            guard let alignment = NSTextAlignment(rawValue: textAlignment) else {
                assert(false, "use a valid alignment mapping integer (0-4)")
                return
            }
            
            flatField.textField.textAlignment = alignment
        }
    }
    
    @IBInspectable
    open var thicknessChange: CGFloat = FlatFieldConfig.default.thicknessChange
    
    @IBInspectable
    open var flatFieldHeight: CGFloat = FlatDropdownConfig.default.flatFieldHeight {
        didSet {
            flatFieldHeightConstraint.constant = flatFieldHeight
        }
    }
    
    // MARK: Required Initalizers
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override convenience init(frame: CGRect) {
        self.init(frame, config: FlatFieldConfig.default, delegate: nil)
    }
    
    // MARK: Programmatic Initalizer
    public init(_ frame: CGRect,
                config: FlatFieldConfig,
                delegate: FloatingLabelDelegate?) {
        
        let flatField = FlatField()
        self.flatField = flatField
        
        let tableView = UITableView()
        self.tableView = tableView
        
        super.init(frame: frame)
        
        addViews()
        addContraints()
        
        initConfig(flatFieldConfig: config)
    }
    
    // MARK: Storyboard Initalizer
    public required init?(coder aDecoder: NSCoder) {
        
        let flatField = FlatField()
        self.flatField = flatField
        
        let tableView = UITableView()
        self.tableView = tableView
        
        super.init(coder: aDecoder)
        
        addViews()
        addContraints()
        
        initConfig()
    }
}

// MARK: - Setup Methods
private extension FlatDropdown {
    func addViews() {
        addSubview(flatField)
        addSubview(tableView)
    }
    
    func addContraints() {
        flatField.translatesAutoresizingMaskIntoConstraints = false
        
        flatField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        flatField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        flatField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        flatField.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        let flatFieldHeightAnchor = flatField.heightAnchor.constraint(equalToConstant: flatFieldHeight)
        flatFieldHeightAnchor.isActive = true
        
        flatFieldHeightConstraint = flatFieldHeightAnchor
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func initConfig(_ config: FlatDropdownConfig = .default,
                    flatFieldConfig: FlatFieldConfig = .default) {
        
        text = flatFieldConfig.text
        placeholderText = flatFieldConfig.placeholderText
        textColor = flatFieldConfig.textColor
        placeholderColor = flatFieldConfig.placeholderColor
        underlineColor = flatFieldConfig.underlineColor
        underlineThickness = flatFieldConfig.underlineThickness
        thicknessChange = flatFieldConfig.thicknessChange
        textAlignment = flatFieldConfig.textAlignment.rawValue
    }
}
