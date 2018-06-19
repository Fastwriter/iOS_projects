//
//  User.swift
//  app
//
//  Created by Demeuov Daulet on 16.04.2018.
//  Copyright © 2018 Daulet Demeuov. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct User{
    
    private var user_email: String?
    private var date:String?
    private var password:String?
    
    init( _ user_email: String,_ date:String,_ password:String) {
        self.user_email = user_email
        self.date = date
        self.password = password
    }
    init(snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        user_email = tweet.value(forKey: "user_email") as? String
        date = tweet.value(forKey: "birth") as? String
        password = tweet.value(forKey: "password") as? String
    }
    
    var User_email: String?{
        get{
            return user_email
        }
    }
    var Password: String?{
        get{
            return password
        }
    }
    var Date:String?{
        return date
    }
    
    func toJSONFormat()-> Any{
        return [
            "user_email": user_email,
            "birth":date,
            "password":password
        ]
    }
    
}
