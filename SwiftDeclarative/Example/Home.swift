//
//  Home.swift
//  SwiftDeclarative
//
//  Created by Gionatan Cernusco on 02/09/2020.
//  Copyright © 2020 Gionatan Cernusco. All rights reserved.
//

import UIKit

class Home: StatefulWidget {
    let onButton1DidTap: (() -> Void)?
    
    var color: Bool = true
    
    init(onButton1DidTap: (() -> Void)? = nil) {
        self.onButton1DidTap = onButton1DidTap
        super.init()
    }
    
    override func build() -> UIView {
        return SafeArea(
            child: Center(
                child: Stack(
                    direction: .vertical,
                    alignment: .center,
                    spacing: 20,
                    children: [
                        Button(
                            height: 30,
                            title: Text("Button 1"),
                            color: color ? .orange : .green,
                            onTap: {
                                print("Tap button 1")
                                self.color = !self.color
                                self.setState()
                                self.onButton1DidTap?()
                            }
                        ),
                        Button(
                            width: 200,
                            title: Text("Button 2", color: .white),
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
    }
}
