//
//  Navigator.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 02/09/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

class Navigator {
    static var currentViewController: UIViewController?
    
    static func pushScene(_ scene: Scene){
        currentViewController?.navigationController?.pushViewController(scene, animated: true)
        Navigator.currentViewController = scene
    }
}
