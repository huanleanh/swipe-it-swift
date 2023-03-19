//
//  WelcomeViewControler.swift
//  SwipeIt
//
//  Created by Huan Le A. on 19/03/2023.
//

import UIKit
class WelcomeViewControler: UIViewController {
    
    @IBOutlet weak var pushMainView: UIButton!
    
    @IBAction func exploreTouch(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let mainVC = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController
        self.present(mainVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
