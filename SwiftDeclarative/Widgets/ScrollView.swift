//
//  ScrollView.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 03/09/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: ScrollView
class ScrollView: UIScrollView {
    
    let direction: NSLayoutConstraint.Axis
    
    init<T: View>( direction: NSLayoutConstraint.Axis = .vertical, child: T){
        self.direction = direction
        super.init(frame: .zero)
        
        addSubview(child)
        child.layout(parent: self)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: View) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
        
        if let child = self.subviews.first {
            child.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                self.contentLayoutGuide.leadingAnchor.constraint(equalTo: child.leadingAnchor),
                self.contentLayoutGuide.topAnchor.constraint(equalTo: child.topAnchor),
                self.contentLayoutGuide.trailingAnchor.constraint(equalTo: child.trailingAnchor),
                self.contentLayoutGuide.bottomAnchor.constraint(equalTo: child.bottomAnchor)
            ])
            switch direction {
            case .horizontal:
                self.frameLayoutGuide.heightAnchor.constraint(equalTo: child.heightAnchor).isActive = true
            case .vertical:
                self.frameLayoutGuide.widthAnchor.constraint(equalTo: child.widthAnchor).isActive = true
            @unknown default:
                break
            }
        }
    }
}
