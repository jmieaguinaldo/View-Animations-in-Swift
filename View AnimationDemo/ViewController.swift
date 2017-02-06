//
//  ViewController.swift
//  View AnimationDemo
//
//  Created by Jamie Rose Aguinaldo on 23/01/2017.
//  Copyright © 2017 Jamie Rose Aguinaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Hide the button by changing it's alpha property
        btnLogin.alpha = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Add viewWillAppear to hide controls
    override func viewWillAppear(animated: Bool) {
        lblLogin.center.y -= view.bounds.width
        txtFirstName.center.x -= view.bounds.width
        txtLastName.center.x += view.bounds.width
    }
    
    // Add viewDidAppear to reanimate controls
    /* 
    * FYI, if you're using XCode 7, move all the code inside
    * viewDidAppear inside viewWillAppear to make it work
    */
    override func viewDidAppear(animated: Bool) {
        /* 
        * Animate lblLogin's position by moving it from the top
        * to it's designated position
        */
        UIView.animateWithDuration(2.0, animations: {
             self.lblLogin.center.y += self.view.bounds.width
        })
        
        /*
        * Animate the UITextFields position by moving it
        * from the sides to the center with spring velocity
        */
        UIView.animateWithDuration(1.5, delay: 0.5,
                                   usingSpringWithDamping: 0.3,
                                   initialSpringVelocity: 0.5,
                                   options: [], animations: {
                                    self.txtFirstName.center.x += self.view.bounds.width
                                    self.txtLastName.center.x -= self.view.bounds.width
            }, completion: nil)
        
        // Animate btnLogin's alpha to show it
        UIView.animateWithDuration(1.0, delay: 2.0,
                                   options: [],
                                   animations: {
                                    self.btnLogin.alpha = 1.0
            }, completion: nil)
    }

}

