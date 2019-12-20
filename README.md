# UIFlipView

[![Swift 5](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/)
[![Core Version](https://img.shields.io/badge/pod-1.8.4-blue.svg)](https://cocoapods.org/)
![Platform](https://img.shields.io/badge/platform-iOS-007CBD)

#### Index
* [參數](#parameters)
* [方向](#directionType)
* [代理](#delegate)
* [範例](#example)

* ChangeLog
    * [事件](#changelog)

## Preview

![](https://media.giphy.com/media/JPgoef3zBUOmuymafu/giphy.gif)

## Installation

```ruby
 pod 'UIFlipView'
```

## Tutorial
- 初始化
    - 從storyboard上加入一個UIView並指定class為UIFlipView，或者...
    - 自行使用純Code初始化，並且addSubView
- 自定義UIView
    - frontView、behindView可自行定義客製畫面

    
## Parameters

```swift
    /// 旋轉所需時間
    public var spinTimeInterval: Double
    /// 動畫方向
    public var flipDirection: FlipDirectionType
    /// 第一個View
    public var frontView: UIView
    /// 第二個View
    public var behindView: UIView
    /// Delegate事件
    public weak var delegate: UIFlipDelegate?
```

## DirectionType

```swift
/// 旋轉方向
public enum FlipDirectionType {
    case top
    case left
    case right
    case bottom
}
```

## Delegate

```swift
/// 翻轉代理事件
public protocol UIFlipDelegate : AnyObject {
    /// 即將開始翻轉
    func flipWillStart(duration: TimeInterval)
    /// 已經完成翻轉
    func flipDidFinish()
}
```

## Example

```swift
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
```

## ChangeLog


## Requirements
 - iOS 8以上


## Author

Lazy

## License

UIFlipView is available under the MIT license. See the LICENSE file for more info.
