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
        self.flipView.flipDirection = .left
        self.flipView.spinTimeInterval = 1.0
        self.flipView.delegate = self
    }

    @IBAction func flipViewBtn(_ sender: Any) {
        self.flipView.flipView()
    }
}

extension ViewController: UIFlipDelegate {

    func flipWillStart(duration: TimeInterval) {
        NSLog("flipWillStart durationTime：\(duration)")
    }

    func flipDidFinish() {
        NSLog("flipDidFinish")
    }
}
