//
//  Extensions.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

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

// MARK: - UIView
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
}

// MARK: - UIEdgeInsets
extension UIEdgeInsets {
    static func all(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    static func symmetric(vertical: CGFloat = 0, horizontal: CGFloat = 0) -> UIEdgeInsets {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
