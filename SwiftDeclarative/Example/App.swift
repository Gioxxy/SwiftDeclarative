//
//  App.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 25/08/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

class App: Scene {
    
    override func build() -> View {
        return Home(
            onButton1DidTap: {
                self.pushScene(Scene2())
            }
        )
    }
}

class Scene2: Scene {
    
    override func build() -> View {
        return Text("Pagina 2")
    }
}
