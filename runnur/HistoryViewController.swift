//
//  HistoryViewController.swift
//  runnur
//
//  Created by Sonali on 04/07/16.
//  Copyright © 2016 Sonali. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController
{

    
    
    
    @IBAction func menuButtonAction(sender: AnyObject)
    {
        if self.revealViewController() != nil
        {
            self.revealViewController().revealToggle(self);
        }
            
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

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