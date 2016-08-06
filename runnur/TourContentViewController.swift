//
//  TourContentViewController.swift
//  runnur
//
//  Created by Archana Vetkar on 28/07/16.
//  Copyright © 2016 Sonali. All rights reserved.
//

import UIKit

class TourContentViewController: UIViewController {
    var pageIndex: Int!
    var imageFile: String!

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.imageFile != nil{
        self.myImageView.image = UIImage(named: self.imageFile)    
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
