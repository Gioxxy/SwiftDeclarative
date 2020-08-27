//
//  Button.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: Button
class Button: UIButton {
    let title: String
    let color: UIColor
    
    init(title: String, color: UIColor, onTap: @escaping ()->()){
        self.title = title
        self.color = color
        super.init(frame: .zero)
        self.onTap(onTap)
        self.backgroundColor = color
        self.isUserInteractionEnabled = true
        
        addText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 100),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func addText(){
        let text = Center(child: Text(title))
        self.addSubview(text)
        text.layout(parent: self)
    }
}
