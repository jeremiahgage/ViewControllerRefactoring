//: [Previous](@previous)
import UIKit
/*:
 # ORGANIZE YOUR CODE
 */
/*:
 ## Group related code
 ### before
 */
class BeforeGroupRelatedCodeViewController: UIViewController {
    var topView: UIView?
    var bottomView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView = UIView()
        if let topView = topView {
            topView.backgroundColor = UIColor.lightGray
            topView.layer.borderWidth = 1
            topView.layer.borderColor = UIColor.black.cgColor
            view.addSubview(topView)
        }
        
        bottomView = UIView()
        if let bottomView = bottomView {
            bottomView.backgroundColor = UIColor.darkGray
            bottomView.layer.borderWidth = 2
            bottomView.layer.borderColor = UIColor.red.cgColor
            view.addSubview(bottomView)
        }
    }
}

/*:
 ### after
 */
class AfterGroupRelatedCodeViewController: UIViewController {
    var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topView)
        view.addSubview(bottomView)
    }
}

/*:
 ## Group related methods
 ### before
 */
class BeforeGroupRelatedMethodsViewController: UIViewController {
    private func setupNotifications() { /* ... */ }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /* ... */
    }
    
    @IBAction func button2Tapped() { /* ... */ }

    override func viewDidLoad() {
        super.viewDidLoad()
        /* ... */
    }

    func hideButtons() {
        button1.isHidden = true
        button2.isHidden = true
    }
    
    private var button1 = UIButton()
    private var button2 = UIButton()

    private func setupTableView() { /* ... */ }
    
    private func setupButtons() { /* ... */ }

    @IBAction func button1Tapped() { /* ... */ }
}

/*:
 ### after
 */
class AfterGroupRelatedMethodsViewController: UIViewController {
    fileprivate var button1 = UIButton()
    fileprivate var button2 = UIButton()
    
    //MARK: Setup & Teardown
    
    override func viewDidLoad() { /* ... */ }
    override func viewDidAppear(_ animated: Bool) { /* ... */ }
    
    private func setupButtons() { /* ... */ }
    private func setupTableView() { /* ... */ }
    private func setupNotifications() { /* ... */ }
    
    //MARK: Actions
    
    @IBAction func button1Tapped() { /* ... */ }
    @IBAction func button2Tapped() { /* ... */ }
}

//MARK: Public

extension AfterGroupRelatedMethodsViewController {
    func hideButtons() {
        button1.isHidden = true
        button2.isHidden = true
    }
}
