//
//  FlatDropdown.swift
//  FlatDropdown
//
//  Created by Ampe on 7/30/18.
//

import FlatField

// MARK: - Class Declaration
@IBDesignable
open class FlatDropdown: UIView {
    
    // MARK: Views
    open weak var flatField: FlatField!
    open weak var tableView: UITableView!
    
    // MARK: Storage
    open var delegate: FlatDropdownDelegate?
    open var dataSource: FlatDropdownDataSource?
    
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
    
    // MARK: Designable Initalizers
    public convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public override convenience init(frame: CGRect) {
        self.init(frame, config: FlatFieldConfig.default, dataSource: nil, delegate: nil)
    }
    
    // MARK: Programmatic Initalizer
    public init(_ frame: CGRect,
                config: FlatFieldConfig,
                dataSource: FlatDropdownDataSource?,
                delegate: FlatDropdownDelegate?) {
        
        let flatField = FlatField()
        self.flatField = flatField
        
        let tableView = UITableView()
        self.tableView = tableView
        
        self.dataSource = dataSource
        
        super.init(frame: frame)
        
        setupFlatField()
        setupTableView()
        
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
        
        setupFlatField()
        setupTableView()
        
        addViews()
        addContraints()
        
        initConfig()
    }
}

// MARK: - Setup Methods
private extension FlatDropdown {
    func setupFlatField() {
        flatField.delegate = self
    }
    
    func setupTableView() {
        tableView.register(FlatDropdownCell.self, forCellReuseIdentifier: FlatDropdownCell.reuseIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
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

// MARK: - Flat Field Delegate Conformance
extension FlatDropdown: FlatFieldDelegate {
    public func editingBegan(_ sender: FlatField) {
        delegate?.didBeginEditing(sender)
    }
    
    public func textChanged(_ sender: FlatField) {
        delegate?.textDidChange(sender)
    }
}

// MARK: - Table View Data Source Conformance
extension FlatDropdown: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlatDropdownCell.reuseIdentifier, for: indexPath) as? FlatDropdownCell else {
            assert(false, "table view cell registration inconsistency")
            return UITableViewCell()
        }
        
        guard let dataSource = dataSource else {
            assert(false, "a data source must be provided")
            return UITableViewCell()
        }
        
        cell.update(dataSource.text(for: indexPath))
        
        return cell
    }
}

// MARK: - Table View Delegate Conformance
extension FlatDropdown: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(indexPath, tableView)
    }
}
