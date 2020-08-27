//
//  Padding.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: Padding
class Padding: PassThroughView {
    let padding: UIEdgeInsets
    
    init<T: UIView>(_ padding: UIEdgeInsets, child: T){
        self.padding = padding
        super.init(frame: .zero)
        
        //self.isUserInteractionEnabled = false
        
        addSubview(child)
        child.layout(parent: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: padding.left),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -padding.right),
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: padding.top),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding.bottom),
        ])
    }
}
