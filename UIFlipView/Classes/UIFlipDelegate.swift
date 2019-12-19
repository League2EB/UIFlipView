//
//  UIFlipDelegate.swift
//  UIFlipView
//
//  Created by Macbook Air on 2019/12/19.
//

import UIKit

/// 翻轉生命流程
public protocol UIFlipDelegate: class {
    /// 已經完成翻轉
    func didFinish()
    /// 即將開始翻轉
    func flipWillStart(duration: TimeInterval)
}
