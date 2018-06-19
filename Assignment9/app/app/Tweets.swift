//
//  Tweets.swift
//  app
//
//  Created by Demeuov Daulet on 16.04.2018.
//  Copyright © 2018 Daulet Demeuov. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct Tweet{
    private var content: String?
    private var user_email: String?
    private var hashtag:String?
    
    init(_ content: String, _ user_email: String,_ hashtag:String?) {
        self.content = content
        self.user_email = user_email
        self.hashtag = hashtag
    }
    init(snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        content = tweet.value(forKey: "content") as? String
        user_email = tweet.value(forKey: "user_email") as? String
        hashtag = (tweet.value(forKey: "hash") as? String?)!
    }
    var Content: String?{
        get{
            return content
        }
    }
    var User_email: String?{
        get{
            return user_email
        }
    }
    var Hash:String?{
        return hashtag
    }
    func toJSONFormat()-> Any{
        return ["content": content,
                "user_email": user_email,
                "hash":hashtag
        ]
    }
}

