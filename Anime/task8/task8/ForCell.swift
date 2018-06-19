//
//  ForCell.swift
//  task8
//
//  Created by Demeuov Daulet on 04.04.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import UIKit

class ForCell: UITableViewCell {
    @IBOutlet weak var l3: UILabel!
    @IBOutlet weak var cont: UIView!
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var l4: UILabel!
    lazy var x = vvv.center.x
    @IBOutlet weak var vvv: UIView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        vvv.alpha = 0
        back.alpha = 0
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func btn(_ sender: UIButton) {
        if x != vvv.center.x || cont.center.x != x{
            vvv.center.x = x
            cont.center.x = x
        }
        UIView.animate(withDuration: 0.3, animations: {
            UIView.transition(with: self.vvv, duration: 0, options: UIViewAnimationOptions.transitionFlipFromRight, animations: {
                self.vvv.alpha = 1
            })
            
        })
        
        
        
        
    }
    @IBAction func hide(_ sender: UIButton) {
        self.back.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.vvv.center.x += 300
            self.vvv.alpha = 0
        })
    }
    
}
