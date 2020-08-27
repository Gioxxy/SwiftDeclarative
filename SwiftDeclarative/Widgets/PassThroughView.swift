//
//  PassThroughView.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 27/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

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
