//
//  ViewController.swift
//  task8
//
//  Created by Demeuov Daulet on 02.04.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    
    @IBAction func NextButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations:{ self.TextField1.center.x += self.view.bounds.width }, completion: nil)
        UIView.animate(withDuration: 1, animations:{
            self.TextField2.center.x -= self.view.bounds.width
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1, animations:{ self.TextField1.center.x -= self.view.bounds.width }, completion: nil)
        
        UIView.animate(withDuration: 1, animations:{
            self.TextField2.center.x += self.view.bounds.width
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 1, options: .curveEaseOut, animations: {
            self.NextButton.alpha = 1 // Here you will get the animation you want
        }, completion: { _ in
            self.NextButton.isHidden = false // Here you hide it when animation done
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

