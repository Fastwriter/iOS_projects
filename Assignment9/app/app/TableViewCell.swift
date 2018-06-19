//
//  TableViewCell.swift
//  app
//
//  Created by Demeuov Daulet on 16.04.2018.
//  Copyright © 2018 Daulet Demeuov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var hashtag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
