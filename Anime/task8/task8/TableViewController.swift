//
//  TableViewController.swift
//  Animation(Task8)
//
//  Created by kanat on 02.04.2018.
//  Copyright © 2018 kanat. All rights reserved.


import UIKit

class TableViewController: UITableViewController  {
//    var a1 = ["IPhone 7 Plus","Samsung Galaxy s8","Nexus 6P","Google Pixel"]
//    var a2 = ["350$","400$","700$","650$"]
//    var a3 = ["A10 Fusion","Snapdragon 835","Snapdragon 809","Snapdragon 812"]
//    var a4 = ["12 MPX","13 MPX","S13.2 MPX","20 MPX"]
    var a1 = [String]()
    var a2 = [String]()
    var a3 = [String]()
    var a4 = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2) {
            self.myTable.reloadData()
        }
        
        insertRows()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        insertRows()

    }
    
   
    @IBOutlet var myTable: UITableView!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return a2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ForCell

        cell.l1.text = self.a1[indexPath.row]
        cell.l2.text = self.a2[indexPath.row]
        cell.l3.text = self.a3[indexPath.row]
        cell.l4.text = self.a4[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func insertRows(){
        insertRow(ind: 0, "IPhone 7 Plus","350$","A10 Fusion","12 MPX") {
            self.insertRow(ind: 1,"Samsung Galaxy s8","400$","Snapdragon 835","12 MPX", comp: {
                self.insertRow(ind: 2,"Nexus 6P","700$","Snapdragon 809","13 MPX", comp: {
                    self.insertRow(ind: 3,"Google Pixel","650$","Snapdragon 812","12.5 MPX", comp: {
                        self.insertRow(ind: 4,"HTC One M9","500$","Snapdragon 800","11.5 MPX", comp: {
                            self.insertRow(ind: 5,"LG G4","400$","Snapdragon 900","13.5 MPX", comp: {
                                
                            })
                        })
                        
                    })
                })
            })
        }
    }
    func insertRow(ind:Int,_ str1:String,_ str2:String,_ str3:String,_ str4:String,comp:@escaping ()->Void){
        let indexPath = IndexPath(row: ind, section: 0)
        a1.append(str1);a2.append(str2);a3.append(str3);a4.append(str4)
        tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.left)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6) {
            comp()
        }
    }
    
    
 
    
    

}
