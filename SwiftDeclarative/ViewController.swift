//
//  ViewController.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 25/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = SafeArea(
            child: Center(
                child: Stack(
                    direction: .vertical,
                    alignment: .center,
                    spacing: 20,
                    children: [
                        Button(
                            title: "Button 1",
                            color: .orange,
                            onTap: {
                                
                            }
                        ),
                        Button(
                            title: "Button 2",
                            color: .blue,
                            onTap: {
                                print("Tap button 2")
                            }
                        )
                    ]
                )
            )
        )
        
        self.view.addSubview(layout)
        layout.layout(parent: self.view)
    }
}

extension UIView {
    @objc func layout(parent: UIView) {}
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.topAnchor
      }
      return self.topAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return self.safeAreaLayoutGuide.leadingAnchor
      }
      return self.leadingAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return self.safeAreaLayoutGuide.trailingAnchor
      }
      return self.trailingAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.bottomAnchor
      }
      return self.bottomAnchor
    }
    
//    @discardableResult
//    func child<T: UIView>(_ subview: T) -> T {
//        addSubview(subview)
//        subview.layout(parent: self)
//        return self
//    }
    
//    @discardableResult
//    func children<T: UIView>(_ subviews: [T]) -> [T] {
//        subviews.forEach({ subview in
//            addArrangedSubview(subview)
//            subview.layout(parent: self)
//        })
//        return self
//    }
}

// MARK: - UIControl OnTap Closure

@objc class ClosureSleeve: NSObject {
    let closure: ()->()

    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }

    @objc func invoke () {
        closure()
    }
}

extension UIControl {
    func onTap(_ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: .touchUpInside)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

// MARK: - WIDGETS

// MARK: PassThroughView
class PassThroughView: UIView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews {
            if !subview.isHidden && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
}

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

// MARK: Text
class Text: UILabel {
    
    init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        self.numberOfLines = 0
        //self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()
    }
}

// MARK: Stack
class Stack: UIStackView {
    
    init<T: UIView>(direction: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, spacing: CGFloat, children: [T]){
        super.init(frame: .zero)
        
        self.alignment = alignment
        self.spacing = spacing
        self.axis = direction
        
        children.forEach({ child in
            self.addArrangedSubview(child)
            child.layout(parent: self)
        })
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc override func layout(parent: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.topAnchor.constraint(equalTo: parent.topAnchor),
        ])
    }
}

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
