//
//  ViewController.swift
//  UIFlipView
//
//  Created by League2EB on 12/19/2019.
//  Copyright (c) 2019 League2EB. All rights reserved.
//

import UIKit
import UIFlipView

class ViewController: UIViewController {

    @IBOutlet weak var flipView: UIFlipView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.flipView.frontView = AView()
        self.flipView.behindView = BView()
        self.flipView.spinTimeInterval = 5.0
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.flipView.addGestureRecognizer(tapGesture)

    }

    @objc
    func handleTap(sender: UITapGestureRecognizer) {
        self.flipView.flipView()
    }
}

