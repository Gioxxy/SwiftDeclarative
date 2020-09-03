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
    
    enum Axis {
        case horizontal
        case vertical
        case both
    }
    
    let axis: Center.Axis
    
    init<T: View>(axis: Center.Axis = .both, child: T){
        self.axis = axis
        super.init(frame: .zero)
        
        addSubview(child)
        child.layout(parent: self)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: View) {
        
        if let child = self.subviews.first {
            self.translatesAutoresizingMaskIntoConstraints = false
            child.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: child.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: child.trailingAnchor),
                self.topAnchor.constraint(equalTo: child.topAnchor),
                self.bottomAnchor.constraint(equalTo: child.bottomAnchor),
            ])
            
            switch axis {
            case .horizontal:
                NSLayoutConstraint.activate([
                    self.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
                    self.leadingAnchor.constraint(greaterThanOrEqualTo: parent.leadingAnchor),
                    self.trailingAnchor.constraint(lessThanOrEqualTo: parent.trailingAnchor),
                ])
            case .vertical:
                NSLayoutConstraint.activate([
                    self.centerYAnchor.constraint(equalTo: parent.centerYAnchor),
                    self.topAnchor.constraint(greaterThanOrEqualTo: parent.topAnchor),
                    self.bottomAnchor.constraint(lessThanOrEqualTo: parent.bottomAnchor)
                ])
            case .both:
                NSLayoutConstraint.activate([
                    self.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
                    self.centerYAnchor.constraint(equalTo: parent.centerYAnchor),
                    self.leadingAnchor.constraint(greaterThanOrEqualTo: parent.leadingAnchor),
                    self.trailingAnchor.constraint(lessThanOrEqualTo: parent.trailingAnchor),
                    self.topAnchor.constraint(greaterThanOrEqualTo: parent.topAnchor),
                    self.bottomAnchor.constraint(lessThanOrEqualTo: parent.bottomAnchor)
                ])
            }
        }
    }
}
