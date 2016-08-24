//: [Previous](@previous)
import UIKit
let view = UIView()
/*:
 # REMOVE UNUSED CODE
 */
/*:
 ## comments and line breaks
 ### before
 */

//print 1 through 10
for i in 1...10 {
    
    print(i)
}

//determine if a label should be created
let createLabel = true

//create a label and add it to the view if necessary
if createLabel {
    
    //create the label
    let label = UILabel()
    
    //add the label to the view
    view.addSubview(label)
}

/*:
 ### after
 */
for i in 1...10 {
    print(i)
}

let createLabel2 = true
if createLabel2 {
    let label = UILabel()
    view.addSubview(label)
}

/*:
 ## code that is never executed
 ### before
 */
class BeforeCodeNeverExecutedViewController: UIViewController {
    var button1: UIButton!
    var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button1 = UIButton()
//        button1.setTitle("Do Not Touch", for: .normal)
//        button1.addTarget(self, action: #selector(button1Touched), for: .touchUpInside)
//        view.addSubview(button1)

        button2 = UIButton()
        button2.setTitle("Do Not Touch", for: .normal)
        button2.addTarget(self, action: #selector(button2Touched), for: .touchUpInside)
        view.addSubview(button2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        button1.hidden = true
    }
    
    func button1Touched() {
        print("button 1 touched")
    }

    func button2Touched() {
        print("button 2 touched")
    }
}

/*:
 ### after
 */
class AfterCodeNeverExecutedViewController: UIViewController {
    var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button2 = UIButton()
        button2.setTitle("Do Not Touch", for: .normal)
        button2.addTarget(self, action: #selector(button2Touched), for: .touchUpInside)
        view.addSubview(button2)
    }
    
    func button2Touched() {
        print("button 2 touched")
    }
}

/*:
 ## generated code
 ### before
 */
class BeforeGeneratedCodeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "With Generated Code"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

/*:
 ### after
 */
class AfterGeneratedCodeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Without Generated Code"
    }
}

/*:
 ## other: imports, reference to self, type declarations, etc.
 ### before
 */
import UIKit
import AVFoundation
import SafariServices

enum Country: String {
    case USA
    case Canada
    case Brazil
}

class BeforeOtherViewController: UIViewController {
    var selectedCountry: Country = Country.USA
    var validCountries: [Country] = [Country.USA, Country.Canada]
    var countryString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.validCountries.removeLast()
        self.validCountries.append(Country.Brazil)
        self.countryString = { () -> [String] in 
            var countriesArray: [String] = []
            for country: Country in self.validCountries {
                countriesArray.append(country.rawValue)
            }
            return countriesArray
        }().joined(separator: ",")
    }
}

/*:
 ### after
 */
import UIKit

class AfterOtherViewController: UIViewController {
    
    var selectedCountry = Country.USA
    var validCountries: [Country] = [.USA, .Canada]
    var countryString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validCountries.removeLast()
        validCountries.append(Country.Brazil)
        countryString = validCountries.map({ $0.rawValue }).joined(separator: ",")
    }
}

//: [Next](@next)
