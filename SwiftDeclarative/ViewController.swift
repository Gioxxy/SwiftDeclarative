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
                            height: 50,
                            title: "Button asd asd asd",
                            color: .orange,
                            onTap: {
                                print("Tap button 1")
                            }
                        ),
                        Button(
                            width: 200,
                            title: "Button 2",
                            titleColor: .white,
                            color: .blue,
                            shape: .stadium,
                            onTap: {
                                print("Tap button 2")
                            }
                        ),
                        Text("Asdd")
                    ]
                )
            )
        )
        
        self.view.addSubview(layout)
        layout.layout(parent: self.view)
    }
}
