//
//  Scene.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 02/09/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

// MARK: Scene
class Scene: UIViewController {
    
    @discardableResult
    func build() -> View {
        return View()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let view = build()
        self.view.addSubview(view)
        view.layout(parent: self.view)
    }
    
    func pushScene(_ scene: Scene){
        self.navigationController?.pushViewController(scene, animated: true)
    }
    
}
