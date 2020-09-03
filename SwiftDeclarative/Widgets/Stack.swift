//
//  Stack.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: Stack
class Stack: UIStackView {
    
    init<T: View>(direction: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, spacing: CGFloat, children: [T]){
        super.init(frame: .zero)
        
        self.alignment = alignment
        self.spacing = spacing
        self.axis = direction
        
        children.forEach({ child in
            self.addArrangedSubview(child)
            child.layout(parent: self)
        })
    }
    
    @available(*, unavailable) required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: View) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.topAnchor.constraint(equalTo: parent.topAnchor),
        ])
    }
}
