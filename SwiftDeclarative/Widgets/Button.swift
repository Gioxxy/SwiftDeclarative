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
    
    enum ButtonShape{
        case rect
        case oval
        case stadium
    }
    
    let width: CGFloat?
    let height: CGFloat?
    let title: Text
    let titleInset: UIEdgeInsets
    let color: UIColor
    let shape: ButtonShape
    let borderRadius: CGFloat
    
    init(
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        title: Text,
        titleInset: UIEdgeInsets = UIEdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: UIColor,
        shape: ButtonShape = .rect,
        borderRadius: CGFloat = 5,
        onTap: @escaping ()->()
    ){
        self.width = width
        self.height = height
        self.title = title
        self.titleInset = titleInset
        self.color = color
        self.shape = shape
        self.borderRadius = borderRadius
        super.init(frame: .zero)
        
        self.onTap(onTap)
        self.backgroundColor = color
        self.isUserInteractionEnabled = true
        
        addText()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: View) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let width = width, let height = height {
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: width + titleInset.left + titleInset.right),
                self.heightAnchor.constraint(equalToConstant: height + titleInset.top + titleInset.bottom)
            ])
        } else {
            if let child = self.subviews.first {
                child.translatesAutoresizingMaskIntoConstraints = false

                if let width = width {
                    NSLayoutConstraint.activate([
                        self.widthAnchor.constraint(equalToConstant: width + titleInset.left + titleInset.right),
                        self.topAnchor.constraint(equalTo: child.topAnchor, constant: titleInset.top),
                        self.bottomAnchor.constraint(equalTo: child.bottomAnchor, constant: titleInset.bottom),
                    ])
                } else if let height = height {
                    NSLayoutConstraint.activate([
                        self.heightAnchor.constraint(equalToConstant: height + titleInset.top + titleInset.bottom),
                        self.leadingAnchor.constraint(equalTo: child.leadingAnchor, constant: titleInset.left),
                        self.trailingAnchor.constraint(equalTo: child.trailingAnchor, constant: titleInset.right),
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        self.topAnchor.constraint(equalTo: child.topAnchor, constant: titleInset.top),
                        self.bottomAnchor.constraint(equalTo: child.bottomAnchor, constant: titleInset.bottom),
                        self.leadingAnchor.constraint(equalTo: child.leadingAnchor, constant: titleInset.left),
                        self.trailingAnchor.constraint(equalTo: child.trailingAnchor, constant: titleInset.right),
                    ])
                }
            }
        }
        
    }
    
    private func setShadow(){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
    
    private func setBorders(){
        switch shape {
        case .rect:
            self.layer.cornerRadius = borderRadius
        case .oval:
            self.layer.cornerRadius = max(self.frame.width, self.frame.height) / 2
        case .stadium:
            self.layer.cornerRadius = min(self.frame.width, self.frame.height) / 2
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBorders()
    }
    
    private func addText(){
        let text = Center(child: title)
        self.addSubview(text)
        text.layout(parent: self)
    }
}
