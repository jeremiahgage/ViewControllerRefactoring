//: [Previous](@previous)
import UIKit
/*:
 # EXTRACT DEEPLY NESTED CODE
 */
/*:
 ## consolidate conditional statements
 ### before
 */
var numbers: [Int]? = [1, 2, 3, 4]
if let numbers = numbers {
    if numbers.count > 0 {
        if numbers.count < 5 {
            if numbers[0] == 1 {
                if numbers[1] == 2 {
                    if numbers[2] == 3 {
                        if numbers[3] == 4 {
                            print("numbers are good")
                        }
                    }
                }
            }
        }
    }
}

/*:
 ### after
 */
if let numbers = numbers, numbers.count > 0, numbers.count < 5 {
    let numbersAreGood = numbers[0] == 1 && numbers[1] == 2 && numbers[2] == 3 && numbers[3] == 4
    if numbersAreGood {
        print("numbers are good")
    }
}

/*:
 ## extract to a method
 ### before
 */
var letters: [Character]? = ["A", "B", "C", "D"]
if let letters = letters {
    if letters.count > 0 {
        if letters.count < 5 {
            if letters[0] == "A" {
                if letters[1] == "B" {
                    if letters[2] == "C" {
                        if letters[3] == "D" {
                            print("letters are good")
                        }
                    }
                }
            }
        }
    }
}

/*:
 ### after
 */
func lettersAreGood(letters: [Character]) -> Bool {
    return letters[0] == "A" && letters[1] == "B" && letters[2] == "C" && letters[3] == "D"
}

if let letters = letters, letters.count > 0, letters.count < 5 {
    if lettersAreGood(letters: letters) {
        print("letters are good")
    }
}

/*:
 ## use a guard statement
 ### before
 */
func colorsMatch(view: UIView?, label: UILabel?, button: UIButton?) -> (Bool, UIColor?) {
    if let view = view {
        if let label = label {
            if let button = button {
                if view.backgroundColor != label.backgroundColor {
                    return (false, nil)
                }
                if view.backgroundColor != button.backgroundColor {
                    return (false, nil)
                }
                if label.backgroundColor != button.backgroundColor {
                    return (false, nil)
                }
                return (true, view.backgroundColor)
            }
        }
    }
    return (false, nil)
}

/*:
 ### after
 */
func colorsMatch2(view: UIView?, label: UILabel?, button: UIButton?) -> (Bool, UIColor?) {
    guard let view = view, let label = label, let button = button,
        view.backgroundColor == label.backgroundColor,
        view.backgroundColor == button.backgroundColor,
        label.backgroundColor == button.backgroundColor
        else {
            return (false, nil)
    }
    return (true, view.backgroundColor)
}

//: [Next](@next)
