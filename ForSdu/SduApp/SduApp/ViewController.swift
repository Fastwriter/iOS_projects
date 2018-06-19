//
//  ViewController.swift
//  SduApp
//
//  Created by Demeuov Daulet on 03.03.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var playerController = AVPlayerViewController()
//    var player:AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let videoString:String? = Bundle.main.path(forResource: "", ofType: ".mp4")
//
//        if let url = videoString{
//            let videoURL = NSURL(fileURLWithPath: url)
//
//            self.player = AVPlayer(url: videoURL as URL)
//            self.playerController.player = self.player
//
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func PlayVideo(_ sender: AnyObject) {
//        self.present(self.playerController, animated: true, completion: {
//            self.playerController.player?.play()
//            })
    }
    
    @IBAction func newsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "NewsDirection", sender: self)
    }
    @IBAction func galleryButton(_ sender: UIButton) {
        performSegue(withIdentifier: "GalleryDirection", sender: self)
    }
    @IBAction func contactsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ContactsDirection", sender: self)
    }
    @IBAction func FacultyButton(_ sender: UIButton) {
        performSegue(withIdentifier: "FacultyDirection", sender: self)
    }
    @IBAction func clubsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ClubsDirection", sender: self)
    }
    @IBAction func networksButton(_ sender: UIButton) {
        performSegue(withIdentifier: "NetworksDirection", sender: self)
    }
    
}

