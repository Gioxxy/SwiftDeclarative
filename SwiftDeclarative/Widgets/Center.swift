//
//  Center.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: Center
class Center: PassThroughView {
    
    init<T: UIView>(child: T){
        super.init(frame: .zero)
        
        
        addSubview(child)
        child.layout(parent: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        
        if let child = self.subviews.first {
            self.translatesAutoresizingMaskIntoConstraints = false
            child.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: child.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: child.trailingAnchor),
                self.topAnchor.constraint(equalTo: child.topAnchor),
                self.bottomAnchor.constraint(equalTo: child.bottomAnchor),
                self.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
                self.centerYAnchor.constraint(equalTo: parent.centerYAnchor)
            ])
        }
    }
}
