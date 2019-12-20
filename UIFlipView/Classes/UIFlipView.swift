//
//  FlipView.swift
//
//  Created by Lazy_Lin on 2019/12/19.
//  Copyright © 2019 Lazy. All rights reserved.
//

import UIKit

/// 旋轉方向
public enum FlipDirectionType {
    case top
    case left
    case right
    case bottom
}

open class UIFlipView: UIView {

    /// 旋轉所需時間
    public var spinTimeInterval = 1.0
    /// 動畫方向
    public var flipDirection: FlipDirectionType = .left
    /// 第一個View
    public var frontView = UIView()
    /// 第二個View
    public var behindView = UIView()
    /// Delegate事件
    public weak var delegate: UIFlipDelegate?

    private var isDisplayingPrimary = true

    private var direction: AnimationOptions = .transitionFlipFromLeft

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        setFronView()
        setBehindView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setFronView() {
        self.addSubview(frontView)
        frontView.translatesAutoresizingMaskIntoConstraints = false
        let constraint1 = NSLayoutConstraint(item: frontView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        let constraint2 = NSLayoutConstraint(item: frontView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0)
        let constraint3 = NSLayoutConstraint(item: frontView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0)
        let constraint4 = NSLayoutConstraint(item: frontView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        let array = [constraint1, constraint2, constraint3, constraint4]
        self.addConstraints(array)
    }

    private func setBehindView() {
        self.addSubview(behindView)
        behindView.translatesAutoresizingMaskIntoConstraints = false
        let constraint1 = NSLayoutConstraint(item: behindView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        let constraint2 = NSLayoutConstraint(item: behindView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0)
        let constraint3 = NSLayoutConstraint(item: behindView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0)
        let constraint4 = NSLayoutConstraint(item: behindView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        let array = [constraint1, constraint2, constraint3, constraint4]
        self.addConstraints(array)
        self.sendSubviewToBack(behindView)
        behindView.isHidden = true
    }

    private func flipDirectionPath() -> AnimationOptions {
        switch self.flipDirection {
        case .top:
            return .transitionFlipFromTop
        case .right:
            return .transitionFlipFromRight
        case .left:
            return .transitionFlipFromLeft
        case .bottom:
            return .transitionFlipFromBottom
        }
    }

    @objc
    public final func flipView() {

        if (isDisplayingPrimary == true) {
            behindView.isHidden = false
        } else {
            behindView.isHidden = true
        }

        if let delegate = self.delegate {
            delegate.flipWillStart(duration: spinTimeInterval)
        }

        UIView.transition(from: isDisplayingPrimary ? frontView : behindView, to: isDisplayingPrimary ? behindView : frontView, duration: spinTimeInterval, options: [self.flipDirectionPath(), .showHideTransitionViews]) { [weak self] (finish) in
            guard let `self` = self else { return }
            if finish {
                self.isDisplayingPrimary = !self.isDisplayingPrimary
                if self.isDisplayingPrimary {
                    self.behindView.isHidden = true
                } else {
                    self.behindView.isHidden = false
                }

                if let delegate = self.delegate {
                    delegate.flipDidFinish()
                }
            }
        }
    }
}


