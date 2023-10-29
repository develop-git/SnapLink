## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
import AutoLayoutLink

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let temp = UIView()
        temp.backgroundColor = .cyan
        temp.layoutIn(view)
            // 不设置具体底部边距，则视图具有向下扩展的能力
            .marginsSafe(.unbottom, 0)
        
        let lab1 = textlab("第一个文本数据，视图可压缩展示")
        let lab2 = textlab("第二个文本数据，占据剩余所有空间，并具有动态增加特性")
        
        lab1.layoutIn(temp)
            .width(.min(100))
            .leading()
            // 安全区域基础上再偏移10
            .topSafe(10)
            // 压缩视图
            .compress()
            .bottom(.max(10))
        
        lab2.layoutIn(temp)
            .leading(by: lab1.lyt.trailing)
            .trailing()
            // 未叠加安全区域 偏移10
            .top()
            // 底部动态扩展，最大距离底部10（lab2相对于temp）
            .bottom(.max(10))
    }
}
```

## Requirements
```ruby
iOS 10.0、 tvOS 10.0、macOS 10.12
Swift 5.0
```

## Installation

AutoLayout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby

pod 'AutoLayoutLink', '~> 1.3.3'

```

## Author

  jianli, develop-work@outlook.com

## License

AutoLayout is available under the MIT license. See the LICENSE file for more info.
