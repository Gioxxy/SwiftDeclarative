//
//  StatelessWidget.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 02/09/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

class StatelessWidget: PassThroughView {
    init(){
        super.init(frame: .zero)
        let view = build()
        addSubview(view)
        view.layout(parent: self)
    }
    
    func build() -> View {
        return View()
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
    }
}
