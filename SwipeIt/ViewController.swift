//
//  ViewController.swift
//  SwipeIt
//
//  Created by Huan Le A. on 15/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var avt: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var nameAndAge: UILabel!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var graduation: UITextField!
    @IBOutlet weak var homtown: UITextField!
    @IBOutlet weak var spiritual: UITextField!
    @IBOutlet weak var nopeButton: UIImageView!
    @IBOutlet weak var loveButton: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    var divisor: CGFloat!
    var index = CLongLong(0)
    
    struct profile {
        var UUID: CLongLong
        var profileName: String
        var nameAndAge: String
        var location: String
        var graduation: String
        var homeTown: String
        var spiritual: String
    }
    
    var profileList: [profile] = [
        profile(UUID: 1, profileName: "avt1", nameAndAge: "Anh Huân, 26", location: "Đang ở Thành phố Hồ Chí Minh", graduation: "Bằng cao đẳng/đại học", homeTown: "Quê quán Dak Lak", spiritual: "Đạo Phật"),
        profile(UUID: 2, profileName: "avt2", nameAndAge: "Cuong, 24", location: "Đang ở Bình Dương", graduation: "Bằng cao học", homeTown: "Quê quán Bình Dương", spiritual: "Vô thần")
    ]
    
    @IBAction func panProfile(_ sender: UIPanGestureRecognizer) {
        let profile = sender.view!
        let point = sender.translation(in: view)
        
        let howFar = profile.center.x - view.center.x
        profile.center = CGPoint(x: view.center.x + point.x, y: view.center.y)
        
        profile.transform = CGAffineTransform(rotationAngle: howFar/divisor)
        
        if howFar > 0 {
            profile.backgroundColor = UIColor.systemPink
        } else  {
            profile.backgroundColor = UIColor.gray
        }
        
        
        if sender.state == .ended {
            
            if abs(howFar) < (view.frame.width - 200) {
                UIView.animate(withDuration: 0.3, animations: {
                    profile.center = self.view.center
                    profile.transform = CGAffineTransform(rotationAngle: 0)
                })
                
            } else {
                if howFar > 0 {
                    UIView.animate(withDuration: 0.2, animations: {
                        profile.center = CGPoint(x: profile.center.x + 200, y: profile.center.y)
                        profile.transform = CGAffineTransform(rotationAngle: 0)
                    })
                } else {
                    UIView.animate(withDuration: 0.2, animations: {
                        profile.center = CGPoint(x: profile.center.x - 200, y: profile.center.y)
                        profile.transform = CGAffineTransform(rotationAngle: 0.2)
                    })
                }
                index += 1
                getProfileAtIndex(index: index)
                UIView.animate(withDuration: 0, animations: {
                    profile.center = self.view.center
                    profile.transform = CGAffineTransform(rotationAngle: 0)
                })
            }
            
            profile.backgroundColor = UIColor.white
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiPrepare()
        getProfileAtIndex(index: 0)
    }
    
    func uiPrepare() {
        // divisor use to calculate the rotation
        divisor =  (view.frame.width / 2) / 0.05
        
        backButton.isUserInteractionEnabled = true
        nopeButton.isUserInteractionEnabled = true
        loveButton.isUserInteractionEnabled = true
        
        //        Rounded nope button
        nopeButton.layer.borderWidth = 3
        nopeButton.layer.borderColor = UIColor.purple.cgColor
        nopeButton.layer.masksToBounds = true
        nopeButton.clipsToBounds = true
        nopeButton.layer.cornerRadius = nopeButton.frame.height/2
    }
    
    
    @IBAction func backButtonTapped(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
//    @objc func backButtonTapped(sender: UITapGestureRecognizer) {
//        if sender.state == .ended {
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    
    @IBAction func loveButtonTapped(_ sender: UITapGestureRecognizer) {
//        let profile = sender.view!
//        let point = sender.translation(in: view)
//
//        UIView.animate(withDuration: 0.2, animations: {
//            profile.center = CGPoint(x: profile.center.x + 200, y: profile.center.y)
//            profile.transform = CGAffineTransform(rotationAngle: 0)
//        })
    }
    
    @IBAction func nopeButtonTapped(_ sender: UITapGestureRecognizer) {
    }
    
    
    func getProfileAtIndex(index: CLongLong) {
        let tmpIndex = index % 2 + 1
        for i in profileList {
            if i.UUID == tmpIndex {
                self.avt.image = UIImage(imageLiteralResourceName: i.profileName)
                self.avt.contentMode = .scaleAspectFill
                nameAndAge.text = i.nameAndAge
                location.text = i.location
                graduation.text = i.graduation
                homtown.text = i.homeTown
                spiritual.text = i.spiritual
                //                self.mainView.backgroundColor = UIColor(patternImage:UIImage(imageLiteralResourceName: i.profileName))
                //                self.mainView.contentMode = .redraw
                //                self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png"))
                
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //        UIView.transition(with: self.imageview,
        //                          duration: 2.0,
        //                          options: .transitionCrossDissolve,
        //                          animations: {
        //            self.imageview.image = UIImage(imageLiteralResourceName: "2")
        //        }, completion: nil)
    }
    
    //    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer)
    //    {
    //        if sender.direction == .left
    //        {
    //           print("Swipe left")
    //           // show the view from the right side
    //        }
    //
    //        if sender.direction == .right
    //        {
    //           print("Swipe right")
    //           // show the view from the left side
    //        }
    //    }
    
}
