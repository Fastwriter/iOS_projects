//
//  ForTweetsViewController.swift
//  app
//
//  Created by Demeuov Daulet on 16.04.2018.
//  Copyright © 2018 Daulet Demeuov. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseDatabase

class ForTweetsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myBoard: UITableView!
    
    var tweets: [Tweet] = []
    var ids:[DatabaseReference] = Array()
    private var dbRef: DatabaseReference?
    private var dbRef2:DatabaseReference?
    var current_user_email = {
        return Auth.auth().currentUser?.email
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = current_user_email()
        dbRef2 = Database.database().reference()
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("tweets")
        dbRef?.observe(DataEventType.value, with: { (snapshot) in
            
            self.tweets.removeAll()
            for snap in snapshot.children{
                let tweet = Tweet.init(snapshot: snap as! DataSnapshot)
                self.tweets.append(tweet)
            }
            
            self.tweets.reverse()
            self.myBoard.reloadData()
        })
    }
    
    @IBAction func signoutPressed(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
        }catch{}
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func composeButtonPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add new Tweet", message: "What's up?", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter here"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Hashtag"
        }
        let postAction = UIAlertAction(title: "Post", style: .default) { (_ ) in
            
            let tweet = Tweet.init(alertController.textFields![0].text!,
                                   self.current_user_email()!,alertController.textFields![1].text!)
            self.dbRef?.childByAutoId().setValue(tweet.toJSONFormat())
            self.ids.append((self.dbRef?.childByAutoId())!)
            print((self.dbRef?.childByAutoId())!)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        
        alertController.addAction(postAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as? TableViewCell
        cell?.tweetText.text = tweets[indexPath.row].Content
        cell?.userName.text = tweets[indexPath.row].User_email
        cell?.hashtag.text = tweets[indexPath.row].Hash
        return cell!
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let tweet = tweets[indexPath.row]
            dbRef2?.child("tweets").observeSingleEvent(of: .value, with: { (snapshot) in
                for snap in snapshot.children{
                    let data1 = snap as! DataSnapshot
                    let my_tweet = Tweet.init(snapshot: data1)
                    if my_tweet.Content == tweet.Content && my_tweet.User_email == tweet.User_email{
                        self.dbRef2?.child("tweets").child(data1.key).removeValue()
                    }
                }
                self.tweets.remove(at: indexPath.row)
                self.myBoard.reloadData()
            })
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pro"{
//            if let dest = segue.destination as? ProfileViewController{
//                dest.em = (Auth.auth().currentUser?.email)!
//            }
            
        }
    }

}
