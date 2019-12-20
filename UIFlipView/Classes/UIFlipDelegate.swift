//
//  UIFlipDelegate.swift
//  UIFlipView
//
//  Created by Macbook Air on 2019/12/19.
//

import UIKit

/// 翻轉代理事件
public protocol UIFlipDelegate: class {

    /// 即將開始翻轉
    func flipWillStart(duration: TimeInterval)
    /// 已經完成翻轉
    func flipDidFinish()
}
