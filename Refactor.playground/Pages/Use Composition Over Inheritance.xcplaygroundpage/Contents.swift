//: [Previous](@previous)
import UIKit
/*:
 # USE COMPOSITION OVER INHERITANCE
 */
/*:
 ## protocol oriented programming
 ### before
 */
class LoggingViewController: UIViewController {
    func log(output: [String]) {
        for string in output {
            print(string)
        }
    }
}

class DecorateViewsController: LoggingViewController {
    func decorateAllSubviews(color: UIColor) {
        for subview in view.subviews {
            subview.backgroundColor = color
        }
    }
}

class MainViewController2: DecorateViewsController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log(output: view.subviews.map({ $0.description }))
        decorateAllSubviews(color: UIColor.red)
    }
}

/*:
 ### after
 */
protocol Loggable {
    func log(output: [String])
}
extension Loggable {
    func log(output: [String]) {
        for string in output {
            print(string)
        }
    }
}

protocol SubviewsDecoratable {
    func decorateAllSubviews(color: UIColor)
}
extension SubviewsDecoratable where Self: UIViewController {
    func decorateAllSubviews(color: UIColor) {
        for subview in view.subviews {
            subview.backgroundColor = color
        }
    }
}

class MainViewController: UIViewController, Loggable, SubviewsDecoratable {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log(output: view.subviews.map({ $0.description }))
        decorateAllSubviews(color: UIColor.red)
    }
}

//: [Next](@next)
