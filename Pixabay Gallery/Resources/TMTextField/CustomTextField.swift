//
//  TMTextField.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 20.08.22.
//

import UIKit

class CustomTextField: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textField: UITextField!

    var text: String {
        return textField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomTextField", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.backgroundColor = self.backgroundColor
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        lblTitle.adjustsFontSizeToFitWidth = true
        
        textField.textColor = .label
        textField.clearsOnBeginEditing = false
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 20
        textField.layer.masksToBounds = true
        textField.textAlignment = .center
        
    }
    
    func setPlaceholder(text: String) {
        textField.placeholder = text
    }
    
    func sawError(error: String) {
        lblTitle.text = error
    }
    
}
