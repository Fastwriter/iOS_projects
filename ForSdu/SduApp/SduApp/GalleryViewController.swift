//
//  GalleryViewController.swift
//  SduApp
//
//  Created by Demeuov Daulet on 05.03.2018.
//  Copyright © 2018 Demeuov Daulet. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

//    let array:[String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
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
//    //Number of views
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
//        return array.count
//    }
//
//    //Populate view
//    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: IndexPath)
//    }
}
