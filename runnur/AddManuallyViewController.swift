//
//  AddManuallyViewController.swift
//  runnur
//
//  Created by Sonali on 30/06/16.
//  Copyright © 2016 Sonali. All rights reserved.
//

import UIKit

class AddManuallyViewController: UIViewController,UITextFieldDelegate,NSURLSessionDelegate,NSURLSessionDataDelegate
{
    
    
    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        
       self.dismissViewControllerAnimated(false, completion: nil)
    }
   
    var EmailIds = [String]()
    
    @IBOutlet var emailIDTextField: UITextField!
    
    @IBOutlet var cancelButton: UIButton!
    
    @IBOutlet var addButton: UIButton!

    
    
    @IBAction func cancelButtonAction(sender: AnyObject)
    {
        
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    
    
    //MARK:- IS VALID EMAIL FUNC
    
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
    }

    @IBAction func addButtonAction(sender: AnyObject)
    {
       
        doneButtonNetwork();
        
        
    }
    
    
    
    
    //MARK:-propertyDetailNetwork
    func doneButtonNetwork()
    {
        
        view.endEditing(true);
        
        if(Reachability.isConnectedToNetwork()==true )
        {
            
            
            
            if(emailIDTextField.text == "")
            {
                
                
                
                let alert = UIAlertController(title: "", message: alertMsg.addManuallyEmptyField, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                
                return
            }
            
          if ( emailIDTextField.text != "" )
            {
                if(!isValidEmail(emailIDTextField.text!) )
                {
                    let alert = UIAlertController(title: "", message: alertMsg.addManuallyValidField, preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                   
                     return
                }
                
               
            }
           
            
            
                EmailIds.append(emailIDTextField.text!)
                addFriends();
            
            
            self.emailIDTextField.text = ""
            
            emailIDTextField.resignFirstResponder();
          

            
        }
        else
        {
          
            
         
            
        }
        
    }
    
    
  ///////////////////////// web service//////////////////////////////////
    
    
    
    
    
    
    // MARK:- ADD FRIENDS
    
    func addFriends()
        
    {
        
        // LoaderFile.showLoader(self.view);
        
        let myurl = NSURL(string:"http://sentivphp.azurewebsites.net/addFriends.php")
        
        
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        request.timeoutInterval = 20.0;
        
        let modelName = UIDevice.currentDevice().modelName
        
        let systemVersion = UIDevice.currentDevice().systemVersion;
        
        let make="iphone"
        
        let userId  = "C2A2987E-80AA-482A-BF76-BC5CCE039007"
        
        
        
        var cliendIds = [String]()
        var count = 0;
        for i in EmailIds
        {
            
            cliendIds.append("friendEmailIds[\(count)]=\(i)");
            count++;
        }
        
        let  friendEmailIds  = cliendIds.joinWithSeparator("&")
        print(friendEmailIds);
        

        
        
        let postString = "os=\(systemVersion)&make=\(make)&model=\(modelName)&userId=\(userId)&\(friendEmailIds)";
        
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        let downloadTask = session.dataTaskWithRequest(request);
        
        downloadTask.resume()
        
        
        
    }
    
    

    
    
    
    //MARK:- NSURLSession delegate methods
    
    func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession)
    {
        
        
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, willCacheResponse proposedResponse: NSCachedURLResponse, completionHandler: (NSCachedURLResponse?) -> Void)
    {
        
        let dataString = String(data: self.mutableData, encoding: NSUTF8StringEncoding)
        
        
        
        print(dataString!)
        
        
        if dataTask.currentRequest?.URL! == NSURL(string:"http://sentivphp.azurewebsites.net/addFriends.php")
            
        {
            
            do
                
            {
                
                let json = try NSJSONSerialization.JSONObjectWithData(self.mutableData, options: .MutableContainers) as? NSDictionary
                
                if  let parseJSON = json
                {
                    
                    let status = parseJSON["status"] as? String
                    let msg=parseJSON["message"] as? String
                    if(status=="Success")
                    {
                        
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock
                            {
                                
                                
                                
                                self.emailIDTextField.resignFirstResponder();
                                

//                            if msg == ""
//                            {
                                
                            NSUserDefaults.standardUserDefaults().setObject(msg, forKey: "successMsgOfAddManually")
                           // }
                                
                                
//                            if msg != ""
//                            {
                                
                          
                           // }
    
                                
                                
                         self.presentingViewController.self!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil);

                                
                                
                                
//                                
//                                let alert = UIAlertController(title: "", message:msg , preferredStyle: UIAlertControllerStyle.Alert)
//                                
//                                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
//                                
//                                alert.addAction(alertAction)
//                                
//                                self.presentViewController(alert, animated: true, completion: nil)
                                
                                
                                
                        } // ns close
                        
                        
                        
                        
                    }
                        
                    else if status == "Error"
                        
                    {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock
                            
                            {
                                
                                //  LoaderFile.hideLoader(self.view)
                                
                                let alert = UIAlertController(title: "", message: msg , preferredStyle: UIAlertControllerStyle.Alert)
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                                
                                alert.addAction(okAction)
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                return
                                
                                
                        }
                        
                    }
                    
                    
                    
                }
                
            }
                
            catch
                
            {
                
                
                
                let alert = UIAlertController(title: "", message:"something went wrong try again later." , preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                
                let alertAction2 = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {
                    
                    Void in
                    
                })
                
                alert.addAction(alertAction2)
                
                
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                

                
                print(error)
                
            }
            
        } // if dataTask close
        
        
        
        
    } //// main func
    
    
    
    var mutableData = NSMutableData()
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData)
    {
        
        self.mutableData.appendData(data);
        
        
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        
        self.mutableData.setData(NSData())
        
        completionHandler(NSURLSessionResponseDisposition.Allow)
        
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?)
    {
        
        // LoaderFile.hideLoader(self.view)
        
        let alert = UIAlertController(title: "", message:"something went wrong try again later." , preferredStyle: UIAlertControllerStyle.Alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(alertAction)
        
        let alertAction2 = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {
            
            Void in
            
        })
        
        alert.addAction(alertAction2)
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
    }
    
    

    
    
    //MARK:- KEYBOARD 
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        
        if textField == emailIDTextField
        {
            textField.inputAccessoryView = inputToolbar3
            
            
        }
        
        return true
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == emailIDTextField
        {
            textField.resignFirstResponder();
            
        }
        return true;
    }

    lazy var inputToolbar3: UIToolbar =
        {
            var toolbar = UIToolbar()
            toolbar.barStyle = .Default
            toolbar.translucent = true
            toolbar.sizeToFit()
            
            var doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "inputToolbarDonePressed")
            
            var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            
            var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            
            
            toolbar.setItems([fixedSpaceButton, fixedSpaceButton, flexibleSpaceButton, doneButton], animated: false)
            toolbar.userInteractionEnabled = true
            
            return toolbar
    }()
    func animateViewMoving (up:Bool, moveValue :CGFloat)
    {
        let movementDuration:NSTimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.view.frame = CGRectOffset(self.view.frame, 0,  movement)
        UIView.commitAnimations()
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        if textField == emailIDTextField
        {
            
            
            animateViewMoving(true, moveValue: 60)
            
        }
        
        
    }
    func textFieldDidEndEditing(textField: UITextField)
    {
        
        
        if textField == emailIDTextField
        {
            
            
            animateViewMoving(false, moveValue: 60)
            
        }
        
        
        
    }

    
    func inputToolbarDonePressed()
    {
        self.view.endEditing(true);
        
    }
    

  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.emailIDTextField.delegate = self;
           emailIDTextField.autocorrectionType = .No

        // Do any additional setup after loading the view.
    }

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent;
    }
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
