# AutoLayout

[![CI Status](https://img.shields.io/travis/FullStack-Jian/AutoLayout.svg?style=flat)](https://travis-ci.org/FullStack-Jian/AutoLayout)
[![Version](https://img.shields.io/cocoapods/v/AutoLayout.svg?style=flat)](https://cocoapods.org/pods/AutoLayout)
[![License](https://img.shields.io/cocoapods/l/AutoLayout.svg?style=flat)](https://cocoapods.org/pods/AutoLayout)
[![Platform](https://img.shields.io/cocoapods/p/AutoLayout.svg?style=flat)](https://cocoapods.org/pods/AutoLayout)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
import AutoLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temp = UIView()
        temp.backgroundColor = .cyan
        view.layoutAv(temp)
            .size(200)
            .center()
        
        let lab = UILabel()
        lab.backgroundColor = .red
        lab.text = "测试label"
        temp.layoutAv(lab)
            .top()
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

AutoLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

pod 'AutoLayout', '~> 1.2.0'

```

## Author

  jianli, develop-work@outlook.com

## License

AutoLayout is available under the MIT license. See the LICENSE file for more info.
