# AutoLayout-SnapKit

[![CI Status](https://img.shields.io/travis/FullStack-Jian/AutoLayout-SnapKit.svg?style=flat)](https://travis-ci.org/FullStack-Jian/AutoLayout-SnapKit)
[![Version](https://img.shields.io/cocoapods/v/AutoLayout-SnapKit.svg?style=flat)](https://cocoapods.org/pods/AutoLayout-SnapKit)
[![License](https://img.shields.io/cocoapods/l/AutoLayout-SnapKit.svg?style=flat)](https://cocoapods.org/pods/AutoLayout-SnapKit)
[![Platform](https://img.shields.io/cocoapods/p/AutoLayout-SnapKit.svg?style=flat)](https://cocoapods.org/pods/AutoLayout-SnapKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
import AutoLayout_SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.layer.cornerRadius = 30
        // view.addSubview(v)
        view.layoutSv(temp).marginsSafe()
        
        let lab = UILabel()
        lab.backgroundColor = .white
        lab.numberOfLines = 0
        lab.text = "测试label, Do any additional setup after loading the view, typically from a nib."
        temp.layoutSv(lab)
            // 高度动态变化，最大 50
            .height(.max(50))
            // 垂直居中
            .centerY()
            // 水平间距 10
            .horz()
    }
}
```

## Requirements
```ruby
iOS 10.0, macOS 10.12, tvOS 10.0
Swift 5.0
```

## Installation

AutoLayout-SnapKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

pod 'AutoLayout-SnapKit', '~> 1.0.0'

```

## Author

  jianli, develop-work@outlook.com

## License

AutoLayout-SnapKit is available under the MIT license. See the LICENSE file for more info.
