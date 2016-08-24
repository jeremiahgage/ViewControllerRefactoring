//: [Previous](@previous)
import UIKit
/*:
 # SPLIT UP RESPONSIBILITIES
 */
/*:
 ## extract views
 ### before
 */
class BeforeExtractViewsViewController: UIViewController {
    var label: UILabel = UILabel()
    var button: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I'm a label"
        label.backgroundColor = UIColor.blue

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor

        view.addSubview(label)
        view.addSubview(button)
        let views = ["label" : label, "button" : button] as [String : Any]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]-[button]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
}

/*:
 ### after
 */
class ExtractViewsView: UIButton {
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.blue
        return label
    }()
    var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.red, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    convenience init(labelText: String, buttonTitle: String) {
        self.init()
        label.text = labelText
        addSubview(label)
        button.setTitle(buttonTitle, for: .normal)
        addSubview(button)

        let views = ["label" : label, "button" : button] as [String : Any]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-[button]-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
    }
}

class AfterExtractViewsViewController: UIViewController {
    override func loadView() {
        view = ExtractViewsView(labelText: "I'm a label", buttonTitle: "Click Me")
    }
}

/*:
 ## interfacing with extracted objects
 */
protocol ExtractedDelegate: AnyObject {
    func extractedDidSomething(extracted: Extracted)
}

class Extracted {
    weak var delegate: ExtractedDelegate?
    var publicProperty: AnyObject?
    
    private var privateProperty: AnyObject
    
    init(something: AnyObject) {
        privateProperty = something
    }
    
    private func didSomething() {
        delegate?.extractedDidSomething(extracted: self)
    }
    
    func setValue(for something: AnyObject) {
        privateProperty = something
    }
}

/*:
 ## extract models
 ### before
 */
class BeforeExtractModelsViewController: UIViewController {
    var meal: [String : String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meal["mainCourse"] = "salmon"
        meal["side"] = "rice"
        meal["drink"] = "vodka"
        meal["dessert"] = "ice cream"
    }
}

/*:
 ### after
 */
struct Meal {
    var mainCourse: String?
    var side: String?
    var drink: String?
    var dessert: String?
}

class AfterExtractModelsViewController: UIViewController {
    var meal = Meal(mainCourse: "salmon", side: "ride", drink: "vodka", dessert: "ice cream")
}

/*:
 ## extract protocol implementations
 ### before
 */
class CarCell: UICollectionViewCell {
    var year: Int = 2000
    func configure(indexPath: IndexPath) {
        year = year + indexPath.item
    }
}

class BeforeExtractProtocolImplementationsViewController: UIViewController, UICollectionViewDataSource {
    let carCellReuseIdentifier = "carCellReuseIdentifier"
    var carsCollectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carsCollectionView.dataSource = self
        carsCollectionView.register(CarCell.self, forCellWithReuseIdentifier: "carCellReuseIdentifier")
    }

    //MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if let carCell = collectionView.dequeueReusableCell(withReuseIdentifier: carCellReuseIdentifier, for: indexPath) as? CarCell {
            carCell.configure(indexPath: indexPath)
            cell = carCell
        }
        return cell
    }
}

/*:
 ### after
 */
class CarsDataSource: NSObject, UICollectionViewDataSource {
    let carCellReuseIdentifier = "carCellReuseIdentifier"
    
    init(collectionView: UICollectionView) {
        super.init()
        collectionView.register(CarCell.self, forCellWithReuseIdentifier: carCellReuseIdentifier)
        collectionView.dataSource = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if let carCell = collectionView.dequeueReusableCell(withReuseIdentifier: carCellReuseIdentifier, for: indexPath) as? CarCell {
            carCell.configure(indexPath: indexPath)
            cell = carCell
        }
        return cell
    }
}

class AfterExtractProtocolImplementationsViewController: UIViewController {
    var carsCollectionView = UICollectionView()
    var carsDataSource: CarsDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carsDataSource = CarsDataSource(collectionView: carsCollectionView)
    }
}

/*:
 ## extract services
 ### before
 */
class BeforeExtractServicesViewController: UIViewController {
    var userId: Int?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userIdString = UserDefaults.standard.string(forKey: "userId"),
            let userId = Int(userIdString) {
            self.userId = userId
        }
        if let userName = UserDefaults.standard.string(forKey: "userName") {
            self.userName = userName
        }
        
        print("user id: \(userId)")
        print("user name: \(userName)")
    }
}

/*:
 ### after
 */
class AccountManager {
    var userId: Int? {
        get {
            guard let userIdString = UserDefaults.standard.string(forKey: "userId"),
                let userId = Int(userIdString) else { return nil }
            return userId
        }
    }
    var userName: String? {
        get {
            guard let userName = UserDefaults.standard.string(forKey: "userName") else {
                return nil }
            return userName
        }
    }
}

class AfterExtractServicesViewController: UIViewController {
    var accountManager = AccountManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("user id: \(accountManager.userId)")
        print("user name: \(accountManager.userName)")
    }
}

//: [Next](@next)
