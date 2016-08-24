/*:
 # Refactoring a Massive View Controller in Swift
*/

import UIKit


//DO NOT REPEAT YOURSELF: method parameter default values

func createLabel(text: String, textColor: UIColor = UIColor.black, padding: UIEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)) -> UILabel {
    return UILabel()
}

createLabel(text: "Defaults")
createLabel(text: "Blue", textColor: UIColor.blue)
createLabel(text: "No Padding", padding: UIEdgeInsets.zero)


//DO NOT REPEAT YOURSELF: define parameters before making a call

var textColor = UIColor.black
let useBlueColor = true
if useBlueColor {
    textColor = UIColor.blue
}
createLabel(text: "Maybe Blue", textColor: textColor)


//EXTRACT CODE THAT’S TOO NESTED: consolidate conditional statements

let condition1 = false, condition2 = true, condition3 = true
let createLabels = condition1 == false && condition2 == true && condition3 == true
if createLabels {
    createLabel(text: "Label 1")
    createLabel(text: "Label 2")
}

//EXTRACT CODE THAT’S TOO NESTED: use a guard statement

var needToGuard: Bool?
func standGuard() {
    guard let needToGuard = needToGuard, needToGuard == true else { return }
}
