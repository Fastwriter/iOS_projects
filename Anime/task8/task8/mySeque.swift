//
//  mySeque.swift
//  task8
//
//  Created by Demeuov Daulet on 05.04.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import UIKit

class mySeque: UIStoryboardSegue {
    override func perform() {
        scale()
    }
    func scale(){
        let toTableViewController = self.destination
        let fromViewController = self.source
        
        let containerView = fromViewController.view.superview
        let originalCenter = fromViewController.view.center
        
        toTableViewController.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toTableViewController.view.center = originalCenter
        
        containerView?.addSubview(toTableViewController.view)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            toTableViewController.view.transform = CGAffineTransform.identity
            }, completion: {
                success in fromViewController.present(toTableViewController, animated: false, completion: nil)
                })
        
    }
}
