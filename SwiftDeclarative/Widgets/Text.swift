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
    
    init(_ text: String, color: UIColor = .black) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = color
        self.numberOfLines = 0
        //self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(greaterThanOrEqualTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(lessThanOrEqualTo: parent.trailingAnchor),
            self.topAnchor.constraint(greaterThanOrEqualTo: parent.topAnchor),
            self.bottomAnchor.constraint(lessThanOrEqualTo: parent.bottomAnchor),
        ])
    }
}
