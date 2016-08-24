//: [Previous](@previous)
import UIKit
let view = UIView()
/*:
 # DO NOT REPEAT YOURSELF
 */
/*:
 ## use a loop
 ### before
 */
print("line 1")
print("line 2")
print("line 3")
print("line 4")
print("line 5")
print("line 6")
print("line 7")
print("line 8")

/*:
 ### after
 */
for i in 1...8 {
    print("line \(i)")
}

/*:
 ## extract to a method
 ### before
 */
let redView = UIView()
redView.backgroundColor = UIColor.red
redView.layer.borderColor = UIColor.black.cgColor
redView.layer.borderWidth = 1

let greenView = UIView()
greenView.backgroundColor = UIColor.green
greenView.layer.borderColor = UIColor.black.cgColor
greenView.layer.borderWidth = 2

let blueView = UIView()
blueView.backgroundColor = UIColor.blue
blueView.layer.borderColor = UIColor.black.cgColor
blueView.layer.borderWidth = 3

/*:
 ### after
 */
func createView(backgroundColor: UIColor, borderColor: UIColor = UIColor.black, borderWidth: CGFloat = 1) -> UIView {
    let view = UIView()
    view.backgroundColor = backgroundColor
    view.layer.borderColor = borderColor.cgColor
    view.layer.borderWidth = borderWidth
    return view
}

let redView2 = createView(backgroundColor: UIColor.red)
let greenView2 = createView(backgroundColor: UIColor.green, borderWidth: 2)
let blueView2 = createView(backgroundColor: UIColor.blue, borderWidth: 3)

/*:
 ## extract to an object (class, struct, enum)
 ### before
 */
let yellowLabel = UILabel()
yellowLabel.text = "Yellow"
yellowLabel.backgroundColor = UIColor.yellow
yellowLabel.layer.borderColor = UIColor.black.cgColor
yellowLabel.layer.borderWidth = 1
yellowLabel.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(yellowLabel)
view.addConstraint(NSLayoutConstraint(item: yellowLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0))
view.addConstraint(NSLayoutConstraint(item: yellowLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0))

let orangeLabel = UILabel()
orangeLabel.text = "Orange"
orangeLabel.backgroundColor = UIColor.orange
orangeLabel.layer.borderColor = UIColor.black.cgColor
orangeLabel.layer.borderWidth = 1
yellowLabel.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(orangeLabel)
view.addConstraint(NSLayoutConstraint(item: orangeLabel, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0))
view.addConstraint(NSLayoutConstraint(item: orangeLabel, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0))

/*:
 ### after
 */
class ColoredLabel: UILabel {
    convenience init(text: String, color: UIColor) {
        self.init(frame: CGRect.zero)
        self.text = "Orange"
        backgroundColor = color
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addTo(view: UIView) {
        view.addSubview(self)
        view.addConstraint(NSLayoutConstraint(item: self, attribute: .leadingMargin, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: self, attribute: .trailingMargin, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: 0))
    }
}

let yellowLabel2 = ColoredLabel(text: "Yellow", color: UIColor.yellow)
yellowLabel2.addTo(view: view)
let orangeLabel2 = ColoredLabel(text: "Orange", color: UIColor.orange)
orangeLabel2.addTo(view: view)

/*:
 ## use extensions
 ### before
 */
class LightGrayViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for view in view.subviews {
            view.backgroundColor = UIColor.gray
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
        }
    }
}

class DarkGrayViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for view in view.subviews {
            view.backgroundColor = UIColor.darkGray
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
        }
    }
}

/*:
 ### after
 */
extension UIViewController {
    func colorViews(color: UIColor) {
        for view in view.subviews {
            view.backgroundColor = color
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.black.cgColor
        }
    }
}

class LightGrayViewController2: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        colorViews(color: UIColor.lightGray)
    }
}

class DarkGrayViewController2: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        colorViews(color: UIColor.darkGray)
    }
}

//: [Next](@next)
