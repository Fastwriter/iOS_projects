//
//  ForSignViewController.swift
//  app
//
//  Created by Demeuov Daulet on 16.04.2018.
//  Copyright © 2018 Daulet Demeuov. All rights reserved.
//

import UIKit
import Firebase

class ForSignViewController: UIViewController {

    private var users: [User] = []
    var dbRef: DatabaseReference?
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("users")
        dbRef?.observe(DataEventType.value, with: { (snapshot) in
            
            self.users.removeAll()
            for snap in snapshot.children{
                let user = User.init(snapshot: snap as! DataSnapshot)
                self.users.append(user)
            }
            
            self.users.reverse()
            
        })
        
    }
    @IBOutlet weak var date: UIDatePicker!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func create(_ sender: UIButton) {
        if let emaill = t1.text,let passw = t2.text{
            Auth.auth().createUser(withEmail: emaill, password: passw, completion: { (user, error) in
                if error == nil{
                    user?.sendEmailVerification(completion: { (error) in
                        if error == nil{
                            let alert = UIAlertController(title: "Message", message: "Check your email.We sent you a verification link", preferredStyle: UIAlertControllerStyle.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                            let user = User.init (emaill, self.date.date.toString(dateFormat: "DD-mm-YYYY"), passw)
                            self.dbRef?.childByAutoId().setValue(user.toJSONFormat())
                            self.present(alert, animated: true, completion: nil)
                        }
                    })
                    
                    self.performSegue(withIdentifier: "home", sender: self)
                }
                else{
                    let alert = UIAlertController(title: "Message", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            })
        }
        
    }
    
}

extension Date {
    func toString( dateFormat format : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
