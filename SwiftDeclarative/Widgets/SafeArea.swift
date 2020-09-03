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
    
    init<T: View>(child: T){
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
            self.leadingAnchor.constraint(equalTo: parent.safeLeadingAnchor),
            self.topAnchor.constraint(equalTo: parent.safeTopAnchor),
            self.trailingAnchor.constraint(equalTo: parent.safeTrailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.safeBottomAnchor)
        ])
    }
}
