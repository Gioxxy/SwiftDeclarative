//
//  SafeArea.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: SafeArea
class SafeArea: PassThroughView {
    
    init<T: UIView>(child: T){
        super.init(frame: .zero)
        
        addSubview(child)
        child.layout(parent: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.safeLeadingAnchor, constant: 1),
            self.topAnchor.constraint(equalTo: parent.safeTopAnchor, constant: 1),
            self.trailingAnchor.constraint(equalTo: parent.safeTrailingAnchor, constant: 1),
            self.bottomAnchor.constraint(equalTo: parent.safeBottomAnchor, constant: 1)
        ])
    }
}
