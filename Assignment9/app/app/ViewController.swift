//
//  ViewController.swift
//  app
//
//  Created by Demeuov Daulet on 15.04.2018.
//  Copyright © 2018 Daulet Demeuov. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email_field.text!, password: password_field.text!, completion: { (user, error) in
            if error == nil{
                user?.sendEmailVerification(completion: { (error) in
                    if error == nil{
                        self.messageLabel.text = "Check your email.We sent you a verification link"
                        self.messageLabel.textColor = UIColor.green
                    }
                })
                
                //self.performSegue(withIdentifier: "signInSegue", sender: self)
            }else{
                self.messageLabel.text = "Something is wrong!"
                self.messageLabel.textColor = UIColor.red
            }
        })
    }
    
    
}

