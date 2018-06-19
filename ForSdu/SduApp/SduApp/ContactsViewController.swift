//
//  ContactsViewController.swift
//  SduApp
//
//  Created by Demeuov Daulet on 05.03.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ContactsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var Map: MKMapView!
    
}
