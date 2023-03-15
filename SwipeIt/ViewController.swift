//
//  ViewController.swift
//  SwipeIt
//
//  Created by Huan Le A. on 15/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageview.image = UIImage(imageLiteralResourceName: "1")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transition(with: self.imageview,
                          duration: 2.0,
                          options: .transitionCrossDissolve,
                          animations: {
            self.imageview.image = UIImage(imageLiteralResourceName: "2")
        }, completion: nil)
    }
    
}
