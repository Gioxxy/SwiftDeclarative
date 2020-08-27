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
                                print("Tap button 1")
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
