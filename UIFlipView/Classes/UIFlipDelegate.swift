//
//  UIFlipDelegate.swift
//  UIFlipView
//
//  Created by Macbook Air on 2019/12/19.
//

import UIKit

public protocol UIFlipDelegate {
    func didFinish()

    func flipWillStart(duration: TimeInterval)
}
