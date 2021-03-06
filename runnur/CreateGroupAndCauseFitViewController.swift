//
//  CreateGroupAndCauseFitViewController.swift
//  runnur
//
//  Created by Sonali on 18/07/16.
//  Copyright © 2016 Sonali. All rights reserved.
//

import UIKit

class CreateGroupAndCauseFitViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,UITextViewDelegate,NSURLSessionDelegate,NSURLSessionDataDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIScrollViewDelegate
{

    
    
     ///// views height constraint
    
    
    
    @IBOutlet var ScrollView: UIScrollView!
    
    
    @IBOutlet var setDistributionHeight: NSLayoutConstraint!
    
    @IBOutlet var setParamenterHeight: NSLayoutConstraint!
    
    
    @IBOutlet var screenNameLAbel: UILabel!
    
    @IBOutlet var selectCauseViewHeightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var setParaViewOneHeight: NSLayoutConstraint!
    
    
    @IBOutlet var setParaViewTwoHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet var setParaViewThreeHeight: NSLayoutConstraint!
    
    
    ////////////
    
   
    
    
    
    @IBOutlet var causeView: UIView!
    
    
    
    
    @IBOutlet var addImage: UIImageView!
    
    
    
    @IBOutlet var addImageButton: UIButton!
    
    @IBOutlet var noteTextLabel: UILabel!
    
    @IBOutlet var noteViewHeightConstraint: UIView!
    
    @IBOutlet var nameOfChallenge: UITextField!
    
    
    @IBOutlet var runWalkHikeImageView: UIImageView!
    
    @IBOutlet var challengeDescription: UITextView!
    
    @IBOutlet var bikeImageView: UIImageView!
    
    @IBOutlet var FirstWinnerTextField: UITextField!
    
    
    @IBOutlet var personalCauseImageView: UIImageView!
    
    @IBOutlet var secondWinnerTextField: UITextField!
    
    
    @IBOutlet var charityImageView: UIImageView!
    @IBOutlet var thirdWinnerTextField: UITextField!
    
    
    
    @IBOutlet var setGoalTextField: UITextField!
    
    
    
    @IBOutlet var firstWinnerLabel: UILabel!
    
    
    @IBOutlet var secondWinnerLabel: UILabel!
    
    
    @IBOutlet var thirdWinnerLabel: UILabel!
    
    
    @IBOutlet var winner_a_ImageView: UIImageView!
    
    
    @IBOutlet var winner_b_ImageView: UIImageView!
    
    
    @IBOutlet var viewOne: UIView!
    
    @IBOutlet var viewTwo: UIView!
    
    @IBOutlet var setBetAmountLabel: UILabel!
    
    
    @IBOutlet var viewThree: UIView!
    
    @IBOutlet var winner_c_ImageView: UIImageView!
    
   
    
    
    ///// select challenge parameter
    
    
    @IBOutlet var distanceBasedImageView: UIImageView!
    
    
    @IBOutlet var distanceBasedLabel: UILabel!
    
    
    @IBOutlet var timeImageView: UIImageView!
    
    
    @IBOutlet var timeBasedLabel: UILabel!
    
    
    @IBOutlet var calorieImageView: UIImageView!
    
    
    @IBOutlet var calorieBasedILabel: UILabel!
    
    
  
    
    
    
    ///////////  Mandatory fields validation
    
    
    
    @IBOutlet var createButton: UIButton!
    
    
    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        
       self.dismissViewControllerAnimated(false, completion: nil)
        
        
    }
    
    var FirstWinner =  Int()
    
    var secondWinner =  Int()
    
    var thirdWinner =  Int()
    
// MARK:- CREATE BUTTON ACTION
    @IBAction func createButtonAction(sender: AnyObject)
    {
        
      
        self.createButtonNetwork();

             
    }
    
    
  //  MARK:- CREATE BUTTON ACTION
    
    func createButtonNetwork()
    
    {
          view.endEditing(true);
        
        if(Reachability.isConnectedToNetwork()==true )
        {
            
            
            if FirstWinnerTextField.text != ""
            {
                FirstWinner =  Int(FirstWinnerTextField.text!)!
            }
            else
            {
                FirstWinner = 0
            }
            
            if secondWinnerTextField.text != ""
            {
                secondWinner =  Int(secondWinnerTextField.text!)!
            }
            else
            {
                secondWinner = 0
            }
            
            if thirdWinnerTextField.text != ""
            {
                thirdWinner =  Int(thirdWinnerTextField.text!)!
            }
            else
            {
                thirdWinner = 0
            }
            
            
            
            
            
            if nameOfChallenge.text == ""
            {
                
                
                let alert = UIAlertController(title: "", message: alertMsg.NameoftheChallenge , preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                
                
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
            
            
            if startDateLabel.text == "june 16, 2016"
            {
                let alert = UIAlertController(title: "", message: alertMsg.StartDate , preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
                
            }
            
            if endDateLabel.text == "june 16, 2016"
            {
                let alert = UIAlertController(title: "", message: alertMsg.EndDate , preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
                
            }
            
            
            
            
            
            
            if NSUserDefaults.standardUserDefaults().boolForKey("GroupFitScreen") == false
                
            {
                
                
                if setGoalTextField.text == "" || setGoalTextField.text == "0"
                {
                    
                    let alert = UIAlertController(title: "", message: alertMsg.SetGoal , preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                    
                    alert.addAction(alertAction)
                    
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    return
                    
                    
                }
                
                
                if setBetAmountperMileTxtFld.text == "" 
                {
                    
                    let alert = UIAlertController(title: "", message: alertMsg.BetAmountPerMile , preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                    
                    alert.addAction(alertAction)
                    
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    return
                    
                    
                }
                
                
                self.createCauseFit()
                
            }
                
            else
            {
                
                if setBetAmountTextField.text == "" ||  setBetAmountTextField.text == "0"

                {
                    
                    let alert = UIAlertController(title: "", message: alertMsg.BetAmount , preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                    
                    alert.addAction(alertAction)
                    
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    return
                }
                
                
                
                if  FirstWinner + secondWinner + thirdWinner != 100
                {
                    
                    print( FirstWinner + secondWinner + thirdWinner)
                    
                    
                    let alert = UIAlertController(title: "", message: alertMsg.PriceDistributionofsumValidation , preferredStyle: UIAlertControllerStyle.Alert)
                    
                    let alertAction = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.Default, handler: nil)
                    
                    alert.addAction(alertAction)
                    
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    return
                }
              
                
                createGroupFit();
                
            }/// else close
            
            
        }
        else
        {
            let alert = UIAlertController(title: "", message: alertMsg.noInternetMsg, preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
            let tryAgainAction = UIAlertAction(title: "Try again", style: UIAlertActionStyle.Default, handler: {action  in
                
               
                self.createButtonNetwork();

                
                
            })
            alert.addAction(okAction)
            alert.addAction(tryAgainAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
            
        }
        
        
        
    }
    
    
    
    
    
        
    
   // MARK:- ACTIVITY TYPE
    
    
    @IBOutlet var runWalkHikeLabel: UILabel!
    
    @IBOutlet var bikeLabel: UILabel!
    
    
    @IBOutlet var runWalkHikeButton: UIButton!
    
    var activityTypeId = String()

    
    @IBAction func runWalkHikeButtonAction(sender: AnyObject)
    {
        
        
        bikeImageView.image = UIImage(named: "ic_bike_inactive")
        bikeLabel.textColor = UIColor.blackColor()
        
        runWalkHikeImageView.image = UIImage(named: "ic_run_active")
        runWalkHikeLabel.textColor = colorCode.RedColor
     
        activityTypeId = "1"
    }
    
    
    
    @IBOutlet var bikeButton: UIButton!
    @IBAction func bikeButtonAction(sender: AnyObject)
    {
        runWalkHikeImageView.image = UIImage(named: "ic_run_inactive")
        
        runWalkHikeLabel.textColor = UIColor.blackColor()
        
         bikeImageView.image = UIImage(named: "ic_bike_active")
       bikeLabel.textColor = colorCode.RedColor
        activityTypeId = "2"

    }
    
  ///////////////////////////////////////////////////////////////////////////////////////////////
    
    //MARK:-  SELECT CASUE
    
    
   var  CauseTypeId = String()

    
    @IBOutlet var personalCauseLabel: UILabel!
    @IBOutlet var charityLabel: UILabel!
    @IBOutlet var personalCauseButton: UIButton!
    @IBAction func personalCauseButtonAction(sender: AnyObject)
    {
     
        
        charityImageView.image = UIImage(named: "ic_charity_inactive")
        charityLabel.textColor = UIColor.blackColor()
        
        personalCauseImageView.image = UIImage(named: "ic_personal_cause_active")
        personalCauseLabel.textColor = colorCode.RedColor

        CauseTypeId = "4"
        
        
    }
    
    @IBOutlet var charityButton: UIButton!
    
    @IBAction func charityButtonAction(sender: AnyObject)
    {
        
        charityImageView.image = UIImage(named: "ic_charity_active")
        charityLabel.textColor = colorCode.RedColor
        
        personalCauseImageView.image = UIImage(named: "ic_personal_cause_inactive")
        personalCauseLabel.textColor = UIColor.blackColor()

       CauseTypeId = "5"
        
    }
    
  // MARK:- PARAMETER TYPE
    
    @IBOutlet var distanceBasedButton: UIButton!
    
    
    @IBOutlet var timeBasedButton: UIButton!
    
    
    
    @IBOutlet var calorieBasedButton: UIButton!
    
    var ParameterTypeId = String()
    
    @IBAction func distanceBasedButtonAction(sender: AnyObject)
    {
        
        distanceBasedLabel.textColor = colorCode.RedColor
        
        distanceBasedImageView.image  = UIImage(named: "ic_distance_active")
        
        
        timeBasedLabel.textColor = UIColor.blackColor()
          timeImageView.image = UIImage(named: "ic_time_inactive")
        
        calorieBasedILabel.textColor = UIColor.blackColor()
        
        calorieImageView.image  = UIImage(named: "ic_calorie_inactive")
        
        ParameterTypeId = "1"
        
    }
    
    
    @IBAction func timeBasedButtonAction(sender: AnyObject)
    {
        
        timeImageView.image = UIImage(named: "ic_time_active")
        
        timeBasedLabel.textColor = colorCode.RedColor

        
        distanceBasedLabel.textColor = UIColor.blackColor()
        
        distanceBasedImageView.image  = UIImage(named: "ic_distance_inactive")

        
       calorieBasedILabel.textColor = UIColor.blackColor()
        
        calorieImageView.image  = UIImage(named: "ic_calorie_inactive")
        
           ParameterTypeId = "2"
        
    }
    
    
    
    @IBAction func calorieBasedButtonAction(sender: AnyObject)
    {
        
        
        calorieBasedILabel.textColor = colorCode.RedColor

        
        calorieImageView.image  = UIImage(named: "ic_calorie_active")
        
        distanceBasedLabel.textColor = UIColor.blackColor()
        
        distanceBasedImageView.image  = UIImage(named: "ic_distance_inactive")
        
        timeBasedLabel.textColor = UIColor.blackColor()
        timeImageView.image = UIImage(named: "ic_time_inactive")
        
        ParameterTypeId = "3"

        
    }
   
    
    
    
    @IBOutlet var setBetAmountTextField: UITextField!
  
    
  var setBetAmountValue = ["10 cents","20 cents","30 cents","40 cents","50 cents","60 cents","70 cents","80 cents","90 cents","$ 1","$ 1.5","$ 2"]
    
    
//MARK:- PICKER VIEW SET BET AMOUNT
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }

    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return setBetAmountValue.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return setBetAmountValue[row]
    }
    
    var AmountPerMile = String()
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        
        setBetAmountperMileTxtFld.text = setBetAmountValue[row]
        
        
        print(setBetAmountperMileTxtFld.text)
        
        
        
        
        let str = setBetAmountperMileTxtFld.text!
        let characterSet = NSCharacterSet(charactersInString: "$")
        
        if let _ = str.rangeOfCharacterFromSet(characterSet, options: .CaseInsensitiveSearch)
        {
            print("true")
            
            let aString: String =  setBetAmountperMileTxtFld.text!
            
            let newString = aString.stringByReplacingOccurrencesOfString("$", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            print(newString)
            
            AmountPerMile = newString
            
            print(AmountPerMile)
            

            
        }
        else
        {
            
            let aString: String =  setBetAmountperMileTxtFld.text!
            
            let newString = aString.stringByReplacingOccurrencesOfString("cents", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            print(newString)
            
             AmountPerMile = "0." + newString
            
            print(AmountPerMile)
            
 
            
            
        }
    
    
    
    }

    
   // MARK:- DATE PICKER 
    
    
   // DATE PICKER TEXT FILED ACTION
    
    
    
    @IBOutlet var startDateLabel: UILabel!
    
    
    
    @IBOutlet var startDateTextField: UITextField!
    
    @IBOutlet var endDateLabel: UILabel!
    
    
    
    @IBOutlet var endDateTextField: UITextField!
    
    
    var pickerDate = NSDate()
    
      var pickerDate2 = NSDate()
    
    func datePickerValueChanged(sender:UIDatePicker)
    {
        
        pickerDate = sender.date
        
        
        print(pickerDate)
        
        
        
        
    }
    
    func datePickerValueChanged2(sender:UIDatePicker)
    {
        
        pickerDate2 = sender.date
        
        
        print(pickerDate2)
        
        
        
        
    }


     let datePickerView1  : UIDatePicker = UIDatePicker()
    let datePickerView2  : UIDatePicker = UIDatePicker()
    
    @IBAction func startDateTxtFldAction(sender: UITextField)
    {
        
      
        startDateLabel.text = ""

        
        datePickerView1.backgroundColor = UIColor.whiteColor();
        
        sender.inputView = datePickerView1
        
        
        datePickerView1.minimumDate = NSDate()
        
        if endDateTextField.text != ""
        {
            datePickerView1.maximumDate = pickerDate2
        }

        
        datePickerView1.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.Default
        
        toolBar.translucent = true
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "doneStartDate")
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let CancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelStartDate")
        
        toolBar.setItems([doneButton,flexSpace, CancelButton], animated: false)
        toolBar.userInteractionEnabled = true
        sender.inputAccessoryView = toolBar
        

        
        
    }
    
    
    
    func doneStartDate()
    {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        let strDate = dateFormatter.stringFromDate(pickerDate)
        self.startDateTextField.text = strDate
        
        let date = startDateTextField.text
        
        
        /////////
        let df33 = NSDateFormatter()
        
        df33.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        
        df33.dateFormat = "MMMM dd, yyyy"

        
        
        let nsdate =  df33.dateFromString(date!)
        
        df33.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        df33.dateFormat = "yyyy/MM/dd"
        
        
        let newDate = df33.stringFromDate(nsdate!)
        
        print(newDate)
        NSUserDefaults.standardUserDefaults().setObject( newDate, forKey: "startDate")
        
        startDateTextField.resignFirstResponder()
        
    }
    
    func cancelStartDate()
    {
        
        startDateLabel.text = "june 16, 2016"

        startDateTextField.text = ""
        
        startDateTextField.resignFirstResponder()

        
    }

    
    @IBAction func endDateTxtFldAction(sender: UITextField)
    {
        
        
        datePickerView2.backgroundColor = UIColor.whiteColor();
        
        sender.inputView = datePickerView2
        
        datePickerView2.minimumDate = pickerDate;

        
       endDateLabel.text = ""
        
        datePickerView2.addTarget(self, action: Selector("datePickerValueChanged2:"), forControlEvents: UIControlEvents.ValueChanged)
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.Default
        
        toolBar.translucent = true
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "doneEndDate")
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let CancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelEndDate")
        
        toolBar.setItems([doneButton,flexSpace, CancelButton], animated: false)
        toolBar.userInteractionEnabled = true
        sender.inputAccessoryView = toolBar
        
    }
    
    func doneEndDate()
    {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        let strDate = dateFormatter.stringFromDate(pickerDate2)
        
        self.endDateTextField.text = strDate
        
        let date = endDateTextField.text
        
        
        
        let df33 = NSDateFormatter()
        
        df33.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        
        df33.dateFormat = "MMMM dd, yyyy"
        
        
        
        let nsdate =  df33.dateFromString(date!)
        
        df33.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        df33.dateFormat = "yyyy/MM/dd"
        
        
        let newDate2 = df33.stringFromDate(nsdate!)
        
        print(newDate2)
        NSUserDefaults.standardUserDefaults().setObject( newDate2, forKey: "endDate")
        
        
        endDateTextField.resignFirstResponder()

          
    }
    
    func cancelEndDate()
    {
        
        endDateLabel.text = "june 16, 2016"
        
        endDateTextField.text = ""

        endDateTextField.resignFirstResponder()

        
    }

    
    
    
    //////////////////////////////////////////
    
    //MARK:- SET BET AMOUNT TEXT FIELD 
    
    
    
    
    @IBOutlet var betAmountTxtBelowView: UIView!
    
    
    @IBOutlet var ic_betImageView: UIImageView!
    
    
    let setBetAmountPickerView:UIPickerView=UIPickerView()
    
    
    @IBAction func setBetAmountTextFieldAction(sender: UITextField)
    
    
    {
        
        
        
        
        
        
        
    }
    
    
    
    func DoneButtonPickerAction()
    {
       // setBetAmountTextField.resignFirstResponder()

    }
    
    
    func CancelButtonPickerAction()
    {
      
        
        
//       let placeholder6 = NSAttributedString(string: "0", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
//        setBetAmountTextField.attributedPlaceholder = placeholder6
//        
//        
//        setBetAmountTextField.text = ""
//        
//         setBetAmountTextField.resignFirstResponder()
    }
    
    
    
    /////MARK:- TEXT VIEW
    
    func textViewDidBeginEditing(textView: UITextView)
    {
        if challengeDescription.textColor ==  UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)

            
        {
            challengeDescription.text = nil
            challengeDescription.textColor = UIColor.blackColor()
        }
        
    }
    
    
    func textViewDidEndEditing(textView: UITextView)
    {
        if textView.text.isEmpty
        {
            
             challengeDescription.text = "Challenge description"
            challengeDescription.textColor = UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)

        }
    }
    
    
   // MARK:- SET BET AMOUNT $/PER MILE (CAUSE FIT)
    
    
    
    
    @IBOutlet var setBetAmountperMileTxtFld: UITextField!
    
    
    
    @IBOutlet var ic_betCauseFitImageView: UIImageView!
    
    
    
    let setBetAmountperMilePickerView:UIPickerView=UIPickerView()

    
    @IBAction func setBetAmountperMileTxtFld(sender: UITextField)
    {
        
        
        
        sender.inputView = setBetAmountperMilePickerView
        
        setBetAmountperMilePickerView.backgroundColor = UIColor.whiteColor();
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        // toolBar.tintColor = UIColor.blackColor()
        toolBar.backgroundColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "DoneButtonPicker2Action")
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        
        var setBetAmount = UIBarButtonItem(title: "Set Bet Amount $/per mile", style: .Plain, target: self, action: nil)
        
      
        
        
        let CancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "CancelButtonPicker2Action")
        
                
        
        toolBar.setItems([CancelButton,flexSpace,setBetAmount,flexSpace,doneButton], animated: false)
        
        setBetAmount.enabled = false
        toolBar.userInteractionEnabled = true
        
        
        setBetAmount.tintColor = UIColor.blackColor();
        
        setBetAmountperMileTxtFld.inputAccessoryView = toolBar
        setBetAmountperMilePickerView.delegate=self;
        setBetAmountperMilePickerView.dataSource=self;

        
        
    }
    
    
    
    func DoneButtonPicker2Action()
    {
        setBetAmountperMileTxtFld.resignFirstResponder()
        
    }
    
    
    func CancelButtonPicker2Action()
    {
        
        
        
        let placeholder6 = NSAttributedString(string: "0", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        setBetAmountperMileTxtFld.attributedPlaceholder = placeholder6
        
        
        setBetAmountperMileTxtFld.text = ""
        
        setBetAmountperMileTxtFld.resignFirstResponder()
    }

  //  MARK:-  INCLUDE MY CONTRIBUTION
    
    
    var myContributionsId = String()
    
    @IBOutlet var TickUntickButton: UIButton!
    
    
    
    
    @IBAction func tickUntickButtonAction(sender: AnyObject)
    {
        
        if TickUntickButton.currentImage == (UIImage(named: "ic_checked"))
        {
        
            TickUntickButton.setImage(UIImage(named: "ic_uncheck"), forState: UIControlState
                    .Normal)
        
             myContributionsId = "0"
                
        }
        
        else
        {
            TickUntickButton.setImage(UIImage(named: "ic_checked"), forState: UIControlState
                     .Normal)
            
             myContributionsId = "1"
        }
        
        
    }
    
    
    
  //  MARK:- KEYBOARD
    
    
    func inputToolbarDonePressed()
    {
        // self.view.endEditing(true);
        
        
        nameOfChallenge.resignFirstResponder();
        
        challengeDescription.resignFirstResponder();
        
        setBetAmountTextField.resignFirstResponder();
        
        setGoalTextField.resignFirstResponder();
        
        
        
        FirstWinnerTextField.resignFirstResponder();
        secondWinnerTextField.resignFirstResponder();
        thirdWinnerTextField.resignFirstResponder();
        
    }
    

    func keyboardNextButton()
    {
        if self.nameOfChallenge.isFirstResponder()
        {
            self.challengeDescription.becomeFirstResponder()
        }
        
        
        
        if FirstWinnerTextField.isFirstResponder()
        {
            
            self.secondWinnerTextField.becomeFirstResponder()
            
            return
        }
        if secondWinnerTextField.isFirstResponder()
        {
            
            self.thirdWinnerTextField.becomeFirstResponder()
             return
        }
        
        
    }
    func keyboardPreviousButton()
    {
        
        
        if self.challengeDescription.isFirstResponder()
        {
            self.nameOfChallenge.becomeFirstResponder()
            
        }
        
        if secondWinnerTextField.isFirstResponder()
        {
            
            self.FirstWinnerTextField.becomeFirstResponder()
        }

        if thirdWinnerTextField.isFirstResponder()
        {
            
            self.secondWinnerTextField.becomeFirstResponder()
        }
        
        
        
       
    }

    
    //MARK:- KEYBOARD
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
        
        if textField == self.nameOfChallenge
        {
          
            textField.inputAccessoryView = inputToolbar1
            
        }
        
        if textField == self.setBetAmountTextField
        {
            
            textField.inputAccessoryView = inputToolbar5
            
        }

        
        if textField == self.setGoalTextField
        {
            
            textField.inputAccessoryView = inputToolbar4
            
        }
        if textField == self.FirstWinnerTextField
        {
            
            textField.inputAccessoryView = inputToolbarFirstWinnerTxt
            
        }
        if textField == self.secondWinnerTextField
        {
            
            textField.inputAccessoryView = inputToolbarSecWinner
            
        }

        if textField == self.thirdWinnerTextField
        {
            
            textField.inputAccessoryView = inputToolbarThirdWinner
            
        }
        
        return true
    }
    
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool
    {
        challengeDescription.inputAccessoryView = inputToolbar2
        
//        if textView == propertyTextView
//        {
//            animateViewMoving(true, moveValue: 180)
//        }
        return true
        
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool
    {
//        if textView == propertyTextView
//        {
//            animateViewMoving(false, moveValue: 180)
//        }
        return true
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == nameOfChallenge
        {
            textField.resignFirstResponder();
            challengeDescription.becomeFirstResponder();
        }
        
        
        if textField == FirstWinnerTextField
        {
            textField.resignFirstResponder();
           
        }
        
        if textField == secondWinnerTextField
        {
            textField.resignFirstResponder();
            
        }

        if textField == thirdWinnerTextField
        {
            textField.resignFirstResponder();
            
        }

        
        
        
        return true;
    }
    
    
    func registerForKeyboardNotifications()
        
    {
        
        //Adding notifies on keyboard appearing
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateGroupAndCauseFitViewController.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateGroupAndCauseFitViewController.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }

    func deregisterFromKeyboardNotifications()
        
    {
        
        //Removing notifies on keyboard appearing
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        
    }


    var actualContentInset = UIEdgeInsets()
    
    var activeField : AnyObject?
    
    func keyboardWasShown(notification: NSNotification)
        
    {
        
        //Need to calculate keyboard exact size due to Apple suggestions
        
        self.ScrollView.scrollEnabled = true
        
        let info : NSDictionary = notification.userInfo!
        
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue().size
        
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.ScrollView.contentInset = contentInsets
        
        self.ScrollView.scrollIndicatorInsets = contentInsets
        
                
        var aRect : CGRect = self.view.frame
        
        aRect.size.height -= keyboardSize!.height
        
        if let _ = activeField
            
        {
            
            if (!CGRectContainsPoint(aRect, activeField!.frame.origin))
                
            {
                
                self.ScrollView.scrollRectToVisible(activeField!.frame, animated: true)
                
            }
            
        }
        
        
    }
    

    
    func keyboardWillBeHidden(notification: NSNotification)
        
    {
        
        self.ScrollView.contentOffset.y = 0;
        
        //Once keyboard disappears, restore original positions
        
        self.ScrollView.contentInset = actualContentInset
        
        self.ScrollView.scrollIndicatorInsets = actualContentInset
        
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        activeField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        activeField = nil
    }
    


    lazy var inputToolbar1: UIToolbar =
        {
            var toolbar = UIToolbar()
            toolbar.barStyle = .Default
            toolbar.translucent = true
            toolbar.sizeToFit()
            
            
            var doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "inputToolbarDonePressed")
            
            var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            
            var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            
            
            
         
            var nextButton  = UIBarButtonItem(image: UIImage(named: "bt_fwd"), style: .Plain, target: self, action: "keyboardNextButton")
            
            
            
            
            toolbar.setItems([ fixedSpaceButton,nextButton,fixedSpaceButton, flexibleSpaceButton, doneButton], animated: false)
            toolbar.userInteractionEnabled = true
            
            return toolbar
    }()
    
    //////last name text fieled
    

    
    
    lazy var inputToolbar2: UIToolbar =
        {
            var toolbar = UIToolbar()
            toolbar.barStyle = .Default
            toolbar.translucent = true
            toolbar.sizeToFit()
            
            var doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "inputToolbarDonePressed")
            
            var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            
            var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            
            
            var nextButton  = UIBarButtonItem(image: UIImage(named: "bt_fwd"), style: .Plain, target: self, action: "keyboardNextButton")
            
            nextButton.width = 60.0
            
            var previousButton  = UIBarButtonItem(image: UIImage(named: "bt_back"), style: .Plain, target: self, action: "keyboardPreviousButton")
            
            
            
            toolbar.setItems([fixedSpaceButton,previousButton,nextButton, fixedSpaceButton, flexibleSpaceButton, doneButton], animated: false)
            toolbar.userInteractionEnabled = true
            
            return toolbar
    }()
    
    
    
    
    
    
    
    lazy var inputToolbar4: UIToolbar =
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
    
    
    
    
    lazy var inputToolbar5: UIToolbar =
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

    
    
    
    lazy var inputToolbarFirstWinnerTxt: UIToolbar =
        {
            var toolbar = UIToolbar()
            toolbar.barStyle = .Default
            toolbar.translucent = true
            toolbar.sizeToFit()
            
            
            var doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "inputToolbarDonePressed")
            
            var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            
            var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            var nextButton  = UIBarButtonItem(image: UIImage(named: "bt_fwd"), style: .Plain, target: self, action: "keyboardNextButton")
            
            toolbar.setItems([ fixedSpaceButton,nextButton,fixedSpaceButton, flexibleSpaceButton, doneButton], animated: false)
            toolbar.userInteractionEnabled = true
            
            return toolbar
    }()
    

    
    
    lazy var inputToolbarSecWinner: UIToolbar =
        {
            var toolbar = UIToolbar()
            toolbar.barStyle = .Default
            toolbar.translucent = true
            toolbar.sizeToFit()
            
            var doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "inputToolbarDonePressed")
            
            var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            
            var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            
            
            var nextButton  = UIBarButtonItem(image: UIImage(named: "bt_fwd"), style: .Plain, target: self, action: "keyboardNextButton")
            
            nextButton.width = 60.0
            
            var previousButton  = UIBarButtonItem(image: UIImage(named: "bt_back"), style: .Plain, target: self, action: "keyboardPreviousButton")
            
            
            
            toolbar.setItems([fixedSpaceButton,previousButton,nextButton, fixedSpaceButton, flexibleSpaceButton, doneButton], animated: false)
            toolbar.userInteractionEnabled = true
            
            return toolbar
    }()

    lazy var inputToolbarThirdWinner: UIToolbar =
        {
            var toolbar = UIToolbar()
            toolbar.barStyle = .Default
            toolbar.translucent = true
            toolbar.sizeToFit()
            
            var doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "inputToolbarDonePressed")
            
            var flexibleSpaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
            
            var fixedSpaceButton = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            
            var previousButton  = UIBarButtonItem(image: UIImage(named: "bt_back"), style: .Plain, target: self, action: "keyboardPreviousButton")
            
            
            
            toolbar.setItems([fixedSpaceButton,previousButton, fixedSpaceButton, flexibleSpaceButton, doneButton], animated: false)
            toolbar.userInteractionEnabled = true
            
            return toolbar
    }()
    
/////////////////////////////////////////////////////////////////////////////////////////
    
    
    
   // MARK:- ADD IMAGE
    
    
    @IBAction func addImageButtonAction(sender: AnyObject)
    {
        
        
        let alert:UIAlertController=UIAlertController(title:"Select Picture", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cameraAction = UIAlertAction(title:"Camera", style: UIAlertActionStyle.Default)
        {
            UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title:"Gallery", style: UIAlertActionStyle.Default)
        {
            UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title:"Cancel", style: UIAlertActionStyle.Cancel)
        {
            UIAlertAction in
        }
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the actionsheet
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        

        
        
        
    }

    
    
    var picker:UIImagePickerController?=UIImagePickerController()
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            
            picker?.delegate = self
          
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(picker!, animated: true, completion: nil)
            
        }
    }
    func openGallary()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
        {
            let imagePicker=UIImagePickerController()
            imagePicker.delegate=self;
            imagePicker.sourceType=UIImagePickerControllerSourceType.PhotoLibrary
            imagePicker.allowsEditing=true
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    var isPhoto: Bool = false;
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        self.addImage.image = self.rotateImage((info[UIImagePickerControllerOriginalImage] as? UIImage)!)
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func rotateImage(image: UIImage) -> UIImage
    {
        
        if (image.imageOrientation == UIImageOrientation.Up )
        {
            return image
        }
        
        UIGraphicsBeginImageContext(image.size)
        
        image.drawInRect(CGRect(origin: CGPoint.zero, size: image.size))
        let copy = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return copy
    }
    
    
    //   outside web service
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().UUIDString)"
    }

    func createBodyWithParameters(parameters: [String:String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData
    {
        
        
        let body = NSMutableData();
        //        print(parameters);
        if parameters != nil
        {
            for (key, value) in parameters!
            {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        
        
        
        let filename = "challengeImage"
        
        let mimetype = "image/png"
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        
        
        
        body.appendString("--\(boundary)--\r\n")
        
        let responseString = NSString(data: body, encoding: NSUTF8StringEncoding)
        print(responseString)
        return body
    }

    
/// MARK:- WEB SERVICE GROUP FIT
    
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    let loadingView: UIView = UIView()
    func showActivityIndicatory()
    {
        loadingView.frame = CGRectMake(0, 0, 60, 50)
        loadingView.center = view.center
        
        loadingView.backgroundColor = UIColor.grayColor()
        loadingView.alpha = 0.6
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        activityIndicator.frame = CGRectMake(0.0, self.view.frame.height/2, 150.0, 150.0);
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2,
                                               loadingView.frame.size.height / 2);
        loadingView.addSubview(activityIndicator)
        self.view.addSubview(loadingView)
        activityIndicator.startAnimating()
    }
    

    
    
    
    
    
    // MARK:- GROUP FIT
    
    func createGroupFit()
        
    {
        
        self.showActivityIndicatory()
        // LoaderFile.showLoader(self.view);
        
        let myurl = NSURL(string: Url.createGroupFit)
        
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        request.timeoutInterval = 20.0;
        
        let modelName = UIDevice.currentDevice().modelName
        
        let systemVersion = UIDevice.currentDevice().systemVersion;
        
        let make="iphone"
        
        let userId  = "C2A2987E-80AA-482A-BF76-BC5CCE039007"
        
        
        let betAmount = Int(setBetAmountTextField.text!)
        

        let startDate = NSUserDefaults.standardUserDefaults().stringForKey("startDate")
        
        let endDate = NSUserDefaults.standardUserDefaults().stringForKey("endDate")
        
        
        
        if self.addImage.image != UIImage(named: "im_add_image")
        {
            
            let param = [
             
                "userId"  : userId,
                "challengeName" : nameOfChallenge.text!,
                "description" : challengeDescription.text!,
                "betAmount" : String(betAmount!),
                "winner1"  : String(FirstWinner),
                "winner2"  : String(secondWinner),
                "winner3"  : String(thirdWinner),
                "activityType"  : String(activityTypeId),
                "parametersType"  : String(ParameterTypeId),
                "startDate" : startDate!,
                "endDate" : endDate!,
                
                
            ]
            let boundary = generateBoundaryString()
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            //
            print(param)
            
            
            ////// image data with compression
            let imageData  = UIImageJPEGRepresentation(self.addImage.image!, 0.50)
            if imageData==nil
            {
                return;
            }
            
            request.HTTPBody = createBodyWithParameters(param,filePathKey:"challengeImage",imageDataKey: imageData!, boundary: boundary)
            //                request.timeoutInterval = 20.0;
            
        } /// if close
        
        
        else
        {
        
        let postString = "userId=\(userId)&challengeName=\(nameOfChallenge.text!)&description=\(challengeDescription.text!)&betAmount=\(betAmount!)&winner1=\(FirstWinner)&winner2=\(secondWinner)&winner3=\(thirdWinner)&activityType=\(activityTypeId)&parametersType=\(ParameterTypeId)&startDate=\(startDate!)&endDate=\(endDate!)";
        
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
        }
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        let downloadTask = session.dataTaskWithRequest(request);
        
        downloadTask.resume()
        
        
        
    }
    

    
    
    
    // MARK:- CAUSE FIT
    
    func createCauseFit()
        
    {
        
        self.showActivityIndicatory()
        // LoaderFile.showLoader(self.view);
        
        let myurl = NSURL(string: Url.createCauseFit)
        
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        request.timeoutInterval = 20.0;
        
        let modelName = UIDevice.currentDevice().modelName
        
        let systemVersion = UIDevice.currentDevice().systemVersion;
        
        let make="iphone"
        
        let userId  = "C2A2987E-80AA-482A-BF76-BC5CCE039007"
        
        
        let amountPerMile = AmountPerMile
        
        let betAmount = Int(setGoalTextField.text!)
        
        let startDate = NSUserDefaults.standardUserDefaults().stringForKey("startDate")
        
        let endDate = NSUserDefaults.standardUserDefaults().stringForKey("endDate")
        
        
        if self.addImage.image != UIImage(named: "im_add_image")
        {
            
            let param = [
                
                "userId"  : userId,
                "challengeName" : nameOfChallenge.text!,
                "description" : challengeDescription.text!,
                "betAmount" : String(betAmount!),
                "amountPerMile"  : amountPerMile,
                "myContributions"  : myContributionsId,
                "activityType"  : activityTypeId,
                "causes"  : CauseTypeId,
                "startDate" : startDate!,
                "endDate" : endDate!,
                
                
                ]
            let boundary = generateBoundaryString()
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            //
            print(param)
            
            
            ////// image data with compression
            let imageData  = UIImageJPEGRepresentation(self.addImage.image!, 0.50)
            if imageData==nil
            {
                return;
            }
            
            request.HTTPBody = createBodyWithParameters(param,filePathKey:"challengeImage",imageDataKey: imageData!, boundary: boundary)
            //                request.timeoutInterval = 20.0;
            
        } /// if close
        else
        {
        
        let postString = "userId=\(userId)&challengeName=\(nameOfChallenge.text!)&description=\(challengeDescription.text!)&amountPerMile=\(amountPerMile)&betAmount=\(betAmount!)&activityType=\(activityTypeId)&causes=\(CauseTypeId)&startDate=\(startDate!)&endDate=\(endDate!)&myContributions=\(myContributionsId)";
        
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
        }
        
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
        
        
        if dataTask.currentRequest?.URL! == NSURL(string:Url.createGroupFit)
            
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
                                
                                
                                
                                self.activityIndicator.stopAnimating();
                                
                                self.loadingView.removeFromSuperview();

//                                
//                                NSUserDefaults.standardUserDefaults().setObject(msg, forKey: "successMsgOfAddManually")
//                                
//                                self.presentingViewController.self!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil);
//                                
//                                
//                                
                                
                                
                                    let alert = UIAlertController(title: "", message:msg , preferredStyle: UIAlertControllerStyle.Alert)
                                
                                                                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                                
                                                                alert.addAction(alertAction)
                                
                                                                self.presentViewController(alert, animated: true, completion: nil)
                                
                                
                                
                        } // ns close
                        
                        
                        
                        
                    }
                        
                    else if status == "Error"
                        
                    {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock
                            
                            {
                                
                                //  LoaderFile.hideLoader(self.view)
                                
                                self.activityIndicator.stopAnimating();
                                
                                self.loadingView.removeFromSuperview();

                                
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
        
        
        
        if dataTask.currentRequest?.URL! == NSURL(string:Url.createCauseFit)
            
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
                                
                                
                                
                                self.activityIndicator.stopAnimating();
                                
                                self.loadingView.removeFromSuperview();
                                
                                //
                                //                                NSUserDefaults.standardUserDefaults().setObject(msg, forKey: "successMsgOfAddManually")
                                //
                                //                                self.presentingViewController.self!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil);
                                //
                                //
                                //
                                
                                
                                let alert = UIAlertController(title: "", message:msg , preferredStyle: UIAlertControllerStyle.Alert)
                                
                                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                                
                                alert.addAction(alertAction)
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                
                                
                                
                        } // ns close
                        
                        
                        
                        
                    }
                        
                    else if status == "Error"
                        
                    {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock
                            
                            {
                                
                                //  LoaderFile.hideLoader(self.view)
                                
                                self.activityIndicator.stopAnimating();
                                
                                self.loadingView.removeFromSuperview();
                                
                                
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
    
    
    override func viewDidAppear(animated: Bool)
    {
         registerForKeyboardNotifications();
    }
    
    
    override func viewDidDisappear(animated: Bool)
    {
        deregisterFromKeyboardNotifications();
    }
    
    var pickerView = UIPickerView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
      /// delegate 
        
        nameOfChallenge.delegate = self
        challengeDescription.delegate = self
        
        FirstWinnerTextField.delegate = self
        secondWinnerTextField.delegate = self
        thirdWinnerTextField.delegate = self
        setBetAmountTextField.delegate = self
        setBetAmountperMileTxtFld.delegate = self
        
        setGoalTextField.delegate = self;
        
        self.ScrollView.delegate = self;
        
        //  NSUserDefaults.standardUserDefaults().setBool(true, forKey: "GroupFitScreen")
        
     
        nameOfChallenge.autocorrectionType = .No
        
        challengeDescription.autocorrectionType = .No
        
        
        FirstWinnerTextField.autocorrectionType = .No
        secondWinnerTextField.autocorrectionType = .No
        thirdWinnerTextField.autocorrectionType = .No
        setBetAmountTextField.autocorrectionType = .No
        
         setGoalTextField.autocorrectionType = .No
        
        pickerView.delegate = self
        
       // setBetAmountTextField.inputView = pickerView
        
       
        
        
        if NSUserDefaults.standardUserDefaults().boolForKey("GroupFitScreen") == true

        {
            
         
            
            selectCauseViewHeightConstraint.constant = 0
            
            screenNameLAbel.text = "Create GroupFit"
            
            
            let string = "Note: If at the end of a GroupFit only 2 participants remain, then the winners amount will be distributed equally between 1st and 2nd winners." as NSString
            
            let style = NSMutableParagraphStyle()
            style.alignment = .Center
            
           let attributes = [
                NSFontAttributeName: UIFont.systemFontOfSize(12),
               NSParagraphStyleAttributeName: style
          ]
            
        
            
            
            var attributedString =  NSMutableAttributedString(string: string as String, attributes: attributes)
            
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.systemFontOfSize(14.0)]
            
            // Part of string to be bold
           
            attributedString.addAttributes(boldFontAttribute, range: string.rangeOfString("Note:"))
            
            
            noteTextLabel.attributedText = attributedString
            
            noteTextLabel.textColor = colorCode.DarkGrayColor
            
        }
        
        if NSUserDefaults.standardUserDefaults().boolForKey("GroupFitScreen") == false
            
        {
            
              screenNameLAbel.text = "Create CauseFit"
            setDistributionHeight.constant = 0
           setParamenterHeight.constant = 0
          
            
            FirstWinnerTextField.hidden = true
            secondWinnerTextField.hidden = true
            thirdWinnerTextField.hidden = true
            
            
            viewOne.hidden = true
            viewTwo.hidden = true
            viewThree.hidden = true
            
            firstWinnerLabel.hidden = true

            secondWinnerLabel.hidden = true

            thirdWinnerLabel.hidden = true

            
            winner_a_ImageView.hidden = true
            winner_b_ImageView.hidden = true
            winner_c_ImageView.hidden = true
            
            
            setBetAmountLabel.hidden = true
            
            
            betAmountTxtBelowView.hidden = true
            ic_betImageView.hidden = true
            
            setBetAmountTextField.hidden = true
            
            
            
            
            
            let string2 = "Note: The amount that gets donated will be based on the actual distance covered" as NSString
            
            let style = NSMutableParagraphStyle()
            style.alignment = .Center
            
            let attributes = [
                NSFontAttributeName: UIFont.systemFontOfSize(12),
                NSParagraphStyleAttributeName: style
            ]
            
            
            
            var attributedString2 =  NSMutableAttributedString(string: string2 as String, attributes: attributes)
            
            
            let boldFontAttribute = [NSFontAttributeName: UIFont.systemFontOfSize(14.0)]
            
            // Part of string to be bold
            
           // attributedString2.addAttributes(boldFontAttribute, range: string2.rangeOfString("Note:"))
            
            attributedString2.addAttributes(boldFontAttribute, range: string2.rangeOfString("Note:"))
            
            
            noteTextLabel.attributedText = attributedString2
            
            noteTextLabel.textColor = colorCode.DarkGrayColor

            
        }

       
        
        
        addImage.layer.cornerRadius = addImage.frame.size.width / 2;
       addImage.clipsToBounds = true;
       addImage.layer.borderWidth = 1
       addImage.layer.borderColor = colorCode.GrayColor.CGColor
        
        
 //  MARK:- DEFAULT VALUE IN VIEW DIDLOAD    
        
        //////// default values//////
        
        runWalkHikeImageView.image = UIImage(named: "ic_run_active")
        
        runWalkHikeLabel.textColor = colorCode.RedColor
        
        personalCauseImageView.image = UIImage(named: "ic_personal_cause_active")
        personalCauseLabel.textColor = colorCode.RedColor
        

        
        distanceBasedImageView.image = UIImage(named: "ic_distance_active")

          distanceBasedLabel.textColor = colorCode.RedColor
        
       TickUntickButton.setImage(UIImage(named: "ic_checked"), forState: UIControlState
        .Normal)
        
        CauseTypeId = "4"
        
        activityTypeId = "1"
        
        ParameterTypeId = "2"
        
        myContributionsId = "1"
        
        CauseTypeId = "4"

        ///default values
        
        
        
        
        
        
        //MARK:-  padding views
        
        createButton.layer.cornerRadius = 2;
        createButton.clipsToBounds = true
        
        
        
        
        
        ///////// padding views in text fileds
        
        let paddingView1 = UIView(frame: CGRectMake(0, 0, 10, self.nameOfChallenge.frame.height))
        nameOfChallenge.leftView = paddingView1
        nameOfChallenge.leftViewMode = UITextFieldViewMode.Always
        
        
        //MARK:-  placeholder in text fileds
        
        
        let placeholder1 = NSAttributedString(string: "Name of challenge", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        nameOfChallenge.attributedPlaceholder = placeholder1
        
        
        challengeDescription.text = "Challenge description"
        challengeDescription.textColor = colorCode.Gray1Color
        
        
       // MARK:-  placeholder in text fileds
        
        
        let placeholder2 = NSAttributedString(string: "0%", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        FirstWinnerTextField.attributedPlaceholder = placeholder2

        let placeholder3 = NSAttributedString(string: "0%", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        secondWinnerTextField.attributedPlaceholder = placeholder3
     
        
        let placeholder4 = NSAttributedString(string: "0%", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        thirdWinnerTextField.attributedPlaceholder = placeholder4
        
        
        let placeholder5 = NSAttributedString(string: "0", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        setGoalTextField.attributedPlaceholder = placeholder5
        
        let placeholder6 = NSAttributedString(string: "0", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        setBetAmountTextField.attributedPlaceholder = placeholder6

        let placeholder7 = NSAttributedString(string: "0", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        setBetAmountperMileTxtFld.attributedPlaceholder = placeholder7

        
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




