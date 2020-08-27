//
//  Text.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: Text
class Text: UILabel {
    
    init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.numberOfLines = 0
        //self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()
    }
}
