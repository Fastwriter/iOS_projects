//
//  Contact.swift
//  ContactsList
//
//  Created by Demeuov Daulet on 07.02.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import Foundation
import UIKit
class Contact{
    private var contact_name_surname : String?
    private var contact_number : String?
    private var contact_image : UIImage?
    
    init(_ contact_name_surname: String, _ contact_number: String,_ contact_image: UIImage) {
        self.contact_name_surname = contact_name_surname
        self.contact_number = contact_number
        self.contact_image = contact_image
    }
    
    var contactNameSurname: String?{
        get{
            return contact_name_surname
        }
    }
    var contactImage: UIImage?{
        get{
            return contact_image
        }
    }
    var contactNumber: String?{
        get{
            return contact_number
        }
    }
}
