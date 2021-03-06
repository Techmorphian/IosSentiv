//
//  InviteFriendsViewController.swift
//  runnur
//
//  Created by Sonali on 27/07/16.
//  Copyright © 2016 Sonali. All rights reserved.
//

import UIKit

class InviteFriendsViewController: UIViewController,NSURLSessionDelegate,NSURLSessionDataDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate
{

    
/////////////////////////////////////////////////////////////////////
    var inviteFrndsModel = inviteFriendsModel()
    
    var inviteFrndsArray = [inviteFriendsModel]()
    
    var searchInviteFrndsModel = inviteFriendsModel()
    
    var searchInviteFrndsArray = [inviteFriendsModel]()
    
  /////////////////////////////////////////////////////////////////////
    
    
    
    var inviteEmailModel = inviteFriendsModel()
    
    var inviteEmailArray = [inviteFriendsModel]()
    
    var searchEmailModel = inviteFriendsModel()
    
    var searchEmailArray = [inviteFriendsModel]()
    
    
    
    var noInternet = NoInternetViewController()
    
    var error =  errorViewController()
    
    var noFriendResult = NoFriendViewController()
    
    
    var EmailIds = [String]()

    
    @IBAction func backButtonAction(sender: AnyObject)
    {
        
        self.dismissViewControllerAnimated(false, completion: nil)
      
        print("Archana")
        
        
    }
    
    
    
    
    @IBOutlet var InviteFriendsTableView: UITableView!
    
    
    @IBOutlet var searchTextField: UITextField!
    
    
    @IBOutlet var searchCancelButton: UIButton!
    
    
    
    @IBAction func searchCancelButtonAction(sender: AnyObject)
        {
            
            
            
            self.searchButtonActive = false;
            self.searchTextField.text = ""
            self.searchTextField.resignFirstResponder();
            
            self.InviteFriendsTableView.reloadData()
     
            
    }
    @IBOutlet var addButton: UIButton!
    
    
    
    @IBAction func addButtonAction(sender: AnyObject)
    {
        
        self.performSegueWithIdentifier("inviteFriendsEamil", sender: nil)
        
        
    }
   
   /// MARK:- PREPARE FOR SEGUE
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        
        if segue.identifier == "inviteFriendsEamil"
        {
            
            
            
            let toViewController = segue.destinationViewController as! InviteFriendsViaEmailViewController
            
             toViewController.delegate = self
            toViewController.EmailIds = EmailIds
            
            
            
        }
    }

    
    @IBOutlet var inviteButtonView: UIView!
    
    @IBOutlet var inviteButton: UIButton!
    
   //MARK:- INVITE FRNDS
    @IBAction func inviteButtonAction(sender: AnyObject)
    {
        
     
        inviteFriendsNetwork();
    }
    
//MARK:- INVITE FRNDS NETWORK
    
    
  func inviteFriendsNetwork()
    {
    
    
        if(Reachability.isConnectedToNetwork()==true )
        {
            
            
            if selectedFriendsFristName.count == 0
            {
                
                let alert = UIAlertController(title: "", message: alertMsg.doneButton , preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(okAction)
                
                self.presentViewController(alert, animated: true, completion: nil)
                return
                
                
                
            }
            else
                
            {
                
                 self.inviteFriends()
                
            }
            

        }
        
        else
        {
            
            let alert = UIAlertController(title: "", message: alertMsg.noInternetMsg, preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
            let tryAgainAction = UIAlertAction(title: "Try again", style: UIAlertActionStyle.Default, handler: {action  in  self.inviteFriendsNetwork() })
            alert.addAction(okAction)
            alert.addAction(tryAgainAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return

            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    //  MARK:- SEARCH FUNCTION
    
    var searchButtonActive = Bool()
     var searchButtonActive2 = Bool()
    ///////////////////
    
    
    
    var friendsName = String()
    func updateSearchResultsForSearchController(searchController: String)
    {
        self.searchButtonActive = true;
        self.searchButtonActive2 = true;
        
        self.searchInviteFrndsArray.removeAll();
        self.searchEmailArray.removeAll();

        
        for i in 0..<inviteFrndsArray.count
        {
            //////// on i position we get name as well as image position that y we are  appending i position ofcontactImages in to a SearchContactImages
            
            friendsName = inviteFrndsArray[i].friendFirstName + inviteFrndsArray[i].friendLastName
            
            if let _ =  friendsName.lowercaseString.rangeOfString(searchController.lowercaseString, options: .RegularExpressionSearch)
                
            {
                
                self.searchInviteFrndsModel = inviteFriendsModel();
                
                   self.searchInviteFrndsModel.friendId = inviteFrndsArray[i].friendId;
                self.searchInviteFrndsModel.friendFirstName = inviteFrndsArray[i].friendFirstName;
                self.searchInviteFrndsModel.friendLastName = inviteFrndsArray[i].friendLastName;
                
                self.searchInviteFrndsModel.friendEmailId = inviteFrndsArray[i].friendEmailId;
                self.searchInviteFrndsModel.friendPhotoUrl = inviteFrndsArray[i].friendPhotoUrl;
                
                self.searchInviteFrndsModel.friendStatus = inviteFrndsArray[i].friendStatus;
                
                self.searchInviteFrndsModel.isSelected = inviteFrndsArray[i].isSelected;
                
                self.searchInviteFrndsModel.isInvited = inviteFrndsArray[i].isInvited;
                
                self.searchInviteFrndsModel.isInvited = inviteFrndsArray[i].isInvited;
                
                 searchInviteFrndsModel.indexPathRow = i;
                
                searchInviteFrndsArray.append(searchInviteFrndsModel)
                
                //                SearchContactNames.append(friendsList[i])
                //
                //                 //////// on i position we get name as well as image position that y we are  appending i position ofcontactImages in to a SearchContactImages
                //                SearchContactImages.append(contactImages[i])
                
                
                
            }
            
        } //// for close
        
        
        for i in 0..<inviteEmailArray.count
        {

            
            if let _ =  inviteEmailArray[i].InviteEmails.lowercaseString.rangeOfString(searchController.lowercaseString, options: .RegularExpressionSearch)
                
            {
                
                self.searchEmailModel = inviteFriendsModel();
                
                self.searchEmailModel.InviteEmails = inviteEmailArray[i].InviteEmails
                
                
//                self.searchInviteFrndsModel.friendId = inviteFrndsArray[i].friendId;
//                self.searchInviteFrndsModel.friendFirstName = inviteFrndsArray[i].friendFirstName;
//                self.searchInviteFrndsModel.friendLastName = inviteFrndsArray[i].friendLastName;
//                
//                self.searchInviteFrndsModel.friendEmailId = inviteFrndsArray[i].friendEmailId;
//                self.searchInviteFrndsModel.friendPhotoUrl = inviteFrndsArray[i].friendPhotoUrl;
//                
//                self.searchInviteFrndsModel.friendStatus = inviteFrndsArray[i].friendStatus;
//                
//                self.searchInviteFrndsModel.isSelected = inviteFrndsArray[i].isSelected;
//                
//                self.searchInviteFrndsModel.isInvited = inviteFrndsArray[i].isInvited;
//                
//                self.searchInviteFrndsModel.isInvited = inviteFrndsArray[i].isInvited;
//                
                
                
             searchEmailModel.indexPathRow = i;
                
                searchEmailArray.append(searchEmailModel)
                
                
            }

            
        
            
        }
        
        
        
        self.InviteFriendsTableView.reloadData();
    }
    

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        print(range)
        
        if let swRange = textField.text?.rangeFromNSRange(range)
        {
            let textFieldData = (textField.text)!.stringByReplacingCharactersInRange(swRange, withString:string)
            if textFieldData == ""
            {
                searchButtonActive = false;
                 searchButtonActive2 = false;
                
                self.InviteFriendsTableView.reloadData();
            }
            else
            {
                print(textFieldData)
                updateSearchResultsForSearchController(textFieldData)
            }
            
        }
        
        
        return true
    }
    

    
    var EmailContacts = [String]()
     
    
    ///////////////////////////////////////////////////////////
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return 2
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        
        if section == 0
        {
            if searchButtonActive2 == true
                
            {

            return searchEmailArray.count
                
            }
            
            else
            {
                 return inviteEmailArray.count
                
            }

        }
        else
        {
            
            if searchButtonActive == true
                
            {
                
                return self.searchInviteFrndsArray.count
                
            }
            else
            {
                
                return inviteFrndsArray.count
                
            }

            
        }
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
//        if section == 0
//        {
//            
//            if inviteEmailArray.count == 0
//            {
//            return 0
//            }
//            else
//            {
//                return 30
//            }
//
//        }
//        
//        else
//        {
//            
//            if inviteFrndsArray.count == 0
//            {
//                return 0
//            }
//            else
//            {
//            return 30
//
//            }
//        }
    
        
        
        if section == 0
        {
            
            
            if searchButtonActive2 == true
            {
                
                if searchEmailArray.count == 0
                {
                    return 0
                }
                else
                {
                    return 30
                }
 
                
            }
            else
            {
            if inviteEmailArray.count == 0
            {
                return 0
            }
            else
            {
                return 30
            }
                
            }
            
        }
            
        else
        {
            
            if searchButtonActive == true
            {

                
                if searchInviteFrndsArray.count == 0
                {
                    return 0
                }
                else
                {
                    return 30
                    
                }
  
                
            }
            
            else
            {
            
            if inviteFrndsArray.count == 0
            {
                return 0
            }
            else
            {
                return 30
                
            }
                
                
            }
        }

    
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        
        if let headerView = view as? UITableViewHeaderFooterView
        {
            
            headerView.backgroundView?.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
            
            
            headerView.textLabel?.textAlignment = .Left
            
            headerView.textLabel?.textColor = UIColor.blackColor()
            headerView.textLabel!.font = UIFont(name: "System", size: 10)
            
            if section == 0
            {
                headerView.textLabel?.text = "Email Contacts"
            }
            else
            {
                headerView.textLabel?.text = "Friends on Runnur"
                
            }
            
            
            
            
        }
        
    }

    
    //MARK:- CELL FOR ROW INDEX PATH
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: InviteFriendsTableViewCell = tableView.dequeueReusableCellWithIdentifier("InviteFriendsTableViewCell")as!
        InviteFriendsTableViewCell
        
        
        cell.contactImage.layer.cornerRadius = cell.contactImage.frame.size.width / 2;
        cell.contactImage.clipsToBounds = true;
        cell.contactImage.layer.borderWidth = 1
        cell.contactImage.layer.borderColor = UIColor.grayColor().CGColor
        
       ////////////////////////////
        
        
        print(indexPath.section)
        
        if indexPath.section == 0
        {
            
            if (searchButtonActive2 == true)
            {

                cell.friendsNameLabel.text = searchEmailArray[indexPath.row].InviteEmails
                cell.contactImage.image = UIImage(named:"im_default_profile")
                cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")

            }
            else
            {
                
             cell.friendsNameLabel.text = inviteEmailArray[indexPath.row].InviteEmails
           
           cell.contactImage.image = UIImage(named:"im_default_profile")
                
          cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
                
                
            }

        
        }
        
        /////// MARK:- IF SECTION = 1
        
        if indexPath.section == 1
        {

        if (searchButtonActive == true)
        {
           
            
            
            cell.friendsNameLabel.text = searchInviteFrndsArray[indexPath.row].friendFirstName + " " + searchInviteFrndsArray[indexPath.row].friendLastName
            
            
           //  cell.contactImage.kf_setImageWithURL(NSURL(string: searchInviteFrndsArray[indexPath.row].friendPhotoUrl)!, placeholderImage: UIImage(named:"im_default_profile"))
            
            if searchInviteFrndsArray[indexPath.row].friendPhotoUrl != ""
            {
                
                
                
                cell.contactImage.kf_setImageWithURL(NSURL(string: searchInviteFrndsArray[indexPath.row].friendPhotoUrl)!, placeholderImage: UIImage(named:"im_default_profile"))
                
                //cell.contactImage.image = UIImage(named: friendListArray[indexPath.row].conatctImage)
            }
                
            else
            {
                cell.contactImage.image = UIImage(named:"im_default_profile")
                
            }

            
            if searchInviteFrndsArray[indexPath.row].isSelected == true
            {
                cell.setSelected(true, animated: false);
                cell.selectedUnselectedImageView.image = UIImage(named: "ic_checked")
                
                
                    cell.contactImage.kf_setImageWithURL(NSURL(string: searchInviteFrndsArray[indexPath.row].friendPhotoUrl)!, placeholderImage: UIImage(named:"im_default_profile"))
                
                
                
            }
            else
            {
                cell.setSelected(false, animated: false);
                cell.selectedUnselectedImageView.image = UIImage(named: "ic_uncheck")
                
            }
            
            
            if searchInviteFrndsArray[indexPath.row].isSelected == true
            {
                cell.setSelected(true, animated: false);
                cell.selectedUnselectedImageView.image = UIImage(named: "ic_checked")
                
                
                cell.contactImage.kf_setImageWithURL(NSURL(string: searchInviteFrndsArray[indexPath.row].friendPhotoUrl)!, placeholderImage: UIImage(named:"im_default_profile"))
                
                
                
            }
            else
            {
                cell.setSelected(false, animated: false);
                cell.selectedUnselectedImageView.image = UIImage(named: "ic_uncheck")
                
            }

            
            
            
            switch searchInviteFrndsArray[indexPath.row].isInvited
                
            {
            case 1:
                
                cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
                
                break;
            case 2:
                
                
                cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
              
                
                break;
                
                
            case 4:
                
                
                cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
                break;
          
            default:
                break;
            }

            
            
            
        }
        
        else
        {
        
            
        cell.friendsNameLabel.text = inviteFrndsArray[indexPath.row].friendFirstName + " " + inviteFrndsArray[indexPath.row].friendLastName
        
       
        
        if inviteFrndsArray[indexPath.row].friendPhotoUrl != ""
        {
            
            
            
            cell.contactImage.kf_setImageWithURL(NSURL(string: inviteFrndsArray[indexPath.row].friendPhotoUrl)!, placeholderImage: UIImage(named:"im_default_profile"))
            
            //cell.contactImage.image = UIImage(named: friendListArray[indexPath.row].conatctImage)
        }
            
        else
        {
            cell.contactImage.image = UIImage(named:"im_default_profile")
            
        }
        
        
        if inviteFrndsArray[indexPath.row].isSelected == true
        {
                cell.setSelected(true, animated: false);
                cell.selectedUnselectedImageView.image = UIImage(named: "ic_checked")
                
                
               cell.contactImage.kf_setImageWithURL(NSURL(string: inviteFrndsArray[indexPath.row].friendPhotoUrl)!, placeholderImage: UIImage(named:"im_default_profile"))                
                
                
        }
        else
        {
                cell.setSelected(false, animated: false);
                cell.selectedUnselectedImageView.image = UIImage(named: "ic_uncheck")
                
        }
        print(inviteFrndsArray[indexPath.row].isInvited)
            
        switch inviteFrndsArray[indexPath.row].isInvited
        
        {
        case 1:
            
              cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
            
            break;
        case 2:
            
              cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
             break;
            
            
        case 4:
            
            cell.selectedUnselectedImageView.image = UIImage(named: "im_status_invited")
            break;
            
       
        default:
            break;
        }
        
        
      //  self.inviteFrndsArray[indexPath.row].indexPathRow = indexPath.row
        
            
        
        
         } // else close
 
        } //if section = 1 close
      
        return cell
    }
    
   
    
    var selectedFriendsIds = [String]()

    var selectedFriendsFristName = [String]()
    var selectedFriendsLastName  = [String]()
    
    var selectedFriendsEmail = [String]()
    
      var selectedFriendsPhotoUrl = [String]()
    var selectedFriendsStatus = [String]()

  
    
    var selectedIndex = [String]()
    

    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
        
    {
        
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as!  InviteFriendsTableViewCell
        
        
        
        if (searchButtonActive == true)
        {
            
            
            
            cell.setSelected(true, animated: false);
            
            searchInviteFrndsArray[indexPath.row].isSelected=true;
            
            inviteFrndsArray[searchInviteFrndsArray[indexPath.row].indexPathRow].isSelected=true;
            
            cell.selectedUnselectedImageView.image = UIImage(named: "ic_checked")
            
            
            selectedFriendsIds.append(searchInviteFrndsArray[indexPath.row].friendId)

            
            selectedFriendsFristName.append(searchInviteFrndsArray[indexPath.row].friendFirstName)
            
            selectedFriendsLastName.append(searchInviteFrndsArray[indexPath.row].friendLastName)
            
            selectedFriendsPhotoUrl.append(searchInviteFrndsArray[indexPath.row].friendPhotoUrl)
           
            
            selectedIndex.append(String(searchInviteFrndsArray[indexPath.row].indexPathRow))

            
            
            
        }
        
        else
        
        {
            
            
            
            ///// append values
            
            selectedFriendsIds.append(inviteFrndsArray[indexPath.row].friendId)
            
            selectedFriendsFristName.append(inviteFrndsArray[indexPath.row].friendFirstName)
            
             selectedFriendsLastName.append(inviteFrndsArray[indexPath.row].friendLastName)
            
            selectedFriendsEmail.append(inviteFrndsArray[indexPath.row].friendEmailId)
            
            selectedFriendsPhotoUrl.append(inviteFrndsArray[indexPath.row].friendPhotoUrl)
            
            selectedFriendsStatus.append(inviteFrndsArray[indexPath.row].friendStatus)
            
            selectedIndex.append(String(indexPath.row))
            
            cell.setSelected(true, animated: false);
            
            inviteFrndsArray[indexPath.row].isSelected=true;
            
            cell.selectedUnselectedImageView.image = UIImage(named: "ic_checked")
            
            print(selectedIndex)
            
 
            
            
        }
        
        

    
    }
    
    
    
    //MARK:- DID DESELECT ROW INDEX PATH
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! InviteFriendsTableViewCell
        
        cell.selectedUnselectedImageView.image = UIImage(named: "ic_uncheck")

    
    
        if searchButtonActive == true
            
        {
            
            searchInviteFrndsArray[indexPath.row].isSelected=false;
            
            cell.selectedUnselectedImageView.image = UIImage(named: "ic_uncheck")
            
            inviteFrndsArray[searchInviteFrndsArray[indexPath.row].indexPathRow].isSelected=false;
            
            for i in selectedFriendsFristName
            {
                if i == searchInviteFrndsArray[indexPath.row].friendFirstName
                {
                    let index = selectedFriendsFristName.indexOf(i)
                    selectedFriendsFristName.removeAtIndex(index!);
                    
                    
                }
                
            }
            
            for i in selectedFriendsLastName
            {
                if i == searchInviteFrndsArray[indexPath.row].friendLastName
                {
                    let index = selectedFriendsLastName.indexOf(i)
                    selectedFriendsLastName.removeAtIndex(index!);
                    
                    
                }
                
            }
            
            
            for i in selectedIndex
            {
                
                
                if Int(i) == searchInviteFrndsArray[indexPath.row].indexPathRow
                {
                    
                    let index = selectedIndex.indexOf(i)
                    selectedIndex.removeAtIndex(index!)
                    
                }
                
                
            }
            
        }
        
        else
        {
            
            inviteFrndsArray[indexPath.row].isSelected=false;
            
            cell.selectedUnselectedImageView.image = UIImage(named: "ic_uncheck")
            
            
            for i in selectedFriendsFristName
            {
                if i == inviteFrndsArray[indexPath.row].friendFirstName
                {
                    let index = selectedFriendsFristName.indexOf(i)
                    selectedFriendsFristName.removeAtIndex(index!)
                    
                }
                
            }
            for i in selectedFriendsLastName
            {
                if i == inviteFrndsArray[indexPath.row].friendLastName
                {
                    let index = selectedFriendsLastName.indexOf(i)
                    selectedFriendsLastName.removeAtIndex(index!)
                    
                }
                
            }
            
            
            for i in selectedIndex
            {
                if Int(i) == indexPath.row
                {
                    
                    print(selectedIndex)
                    
                    let index = selectedIndex.indexOf(i)
                    selectedIndex.removeAtIndex(index!)
                    
                }
                
            }
            
            
            
        } /// //else close
        

        
        
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    
    }
    
    
    
    
    func getChallengeFriendlist()
        
    {
        
        // LoaderFile.showLoader(self.view);
        
        let myurl = NSURL(string: Url.getChallengeFriendlist)
        
        
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        request.timeoutInterval = 20.0;
        
        
        let userId  = "C2A2987E-80AA-482A-BF76-BC5CCE039007"
        
        let ChallengeId = NSUserDefaults.standardUserDefaults().stringForKey("challengeId")

                
        let postString = "userId=\(userId)&challengeId=\(ChallengeId!)";
       
        
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        let downloadTask = session.dataTaskWithRequest(request);
        
        downloadTask.resume()
        
        
        
    }
    

    
    
    //////////////// web service
    
    // MARK:- Invite Friends WEB SERVICE
    
    func inviteFriends()
        
    {
        
        // LoaderFile.showLoader(self.view);
        
        let myurl = NSURL(string: Url.inviteFriends)
        
        
        let request = NSMutableURLRequest(URL: myurl!)
        
        request.HTTPMethod = "POST"
        
        request.timeoutInterval = 20.0;
       
        
        let userId  = "C2A2987E-80AA-482A-BF76-BC5CCE039007"
        
        let ChallengeId = NSUserDefaults.standardUserDefaults().stringForKey("challengeId")

        
        var cliendIds = [String]()
        var count = 0;
        
        for i in selectedFriendsIds
        {
            
            
            cliendIds.append("friendIds[\(count)]=\(i)");
            
            count++;
        }
        
        
        
//        
        let  friendIds  = cliendIds.joinWithSeparator("&")
        print(friendIds);
        
        
        
        
        let postString = "userId=\(userId)&challengeId=\(ChallengeId!)&currentDate=\(CurrentDateFunc.currentDate())&\(friendIds)";
        
        print(postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
        let downloadTask = session.dataTaskWithRequest(request);
        
        downloadTask.resume()
        
        
        
    }
    
    
    
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
    
    

    
    //MARK:- NSURLSession delegate methods
    
    func URLSessionDidFinishEventsForBackgroundURLSession(session: NSURLSession)
    {
        
        
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, willCacheResponse proposedResponse: NSCachedURLResponse, completionHandler: (NSCachedURLResponse?) -> Void)
    {
        
        let dataString = String(data: self.mutableData, encoding: NSUTF8StringEncoding)
        
        
        
        print(dataString!)
        
        
        if dataTask.currentRequest?.URL! == NSURL(string: Url.inviteFriends)
            
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
                               
                                
                                let alert = UIAlertController(title: "", message: msg , preferredStyle: UIAlertControllerStyle.Alert)
                                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
                                    
                                    self.presentingViewController.self!.dismissViewControllerAnimated(true, completion: nil)
                                    
                                    
                                })
                                
                                alert.addAction(okAction)
                                
                                self.presentViewController(alert, animated: true, completion: nil)
                                return
                                
                                
                                
                        } // ns close
                        
                        
                        
                        
                    }
                        
                    else if status == "Error"
                        
                    {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock{
                                
                                
                                
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
                
                
                
                self.activityIndicator.stopAnimating();
                
                self.loadingView.removeFromSuperview();
                
                let alert = UIAlertController(title: "", message:"something went wrong try again later." , preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                
                let alertAction2 = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {
                    
                    Void in self.inviteFriends();
                    
                })
                
                alert.addAction(alertAction2)
                
                
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                
                
                
                print(error)
                
            }
            
        } // if dataTask close
        
      
        
      ///////// getChallengeFriendlist////////////
        
        
        if dataTask.currentRequest?.URL! == NSURL(string: Url.getChallengeFriendlist)
            
        {
            
            do
                
            {
                
                let json = try NSJSONSerialization.JSONObjectWithData(self.mutableData, options: .MutableContainers) as? NSDictionary
                
                if  let parseJSON = json
                {
                    
                    let status = parseJSON["status"] as? String
                    _=parseJSON["message"] as? String
                    if(status=="Success")
                    {
                        
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock
                            {
                                
                                if  let elements: AnyObject = json!["response"]

                                {
                                    
                                        if let friendList  = elements[0]["friendList"]
                                        {
                                            
                                            
                                            if !(friendList is NSNull )
                                            {
                                                //self.amenitiesName.removeAll();
                                                
                                                for var i = 0; i<friendList!.count; i += 1
                                                {
                                                   
                                                    
                                                self.inviteFrndsModel = inviteFriendsModel()

                                                    
                                                    
                                                let friendId = friendList![i]["friendId"] as! String
                                                    
                                                    if friendId != ""
                                                    {
                                                        self.inviteFrndsModel.friendId = friendId
                                                    }

                                                  let friendEmailId = friendList![i]["friendEmailId"] as! String
                                                    if friendEmailId != ""
                                                    {
                                                        self.inviteFrndsModel.friendEmailId = friendEmailId
                                                    }

                                                    let friendFirstName = friendList![i]["friendFirstName"] as! String
                                                    if friendFirstName != ""
                                                    {
                                                        self.inviteFrndsModel.friendFirstName = friendFirstName
                                                    }
                                                    
                                                    let friendLastName = friendList![i]["friendLastName"] as! String
                                                    if friendLastName != ""
                                                    {
                                                        self.inviteFrndsModel.friendLastName = friendLastName
                                                    }
                                                    
                                                    let friendPhotoUrl = friendList![i]["friendPhotoUrl"] as! String
                                                    if friendPhotoUrl != ""
                                                    {
                                                        self.inviteFrndsModel.friendPhotoUrl = friendPhotoUrl
                                                    }
                                                    
                                                    let friendStatus = friendList![i]["friendStatus"] as! String
                                                    if friendStatus != ""
                                                    {
                                                        self.inviteFrndsModel.friendStatus = friendStatus
                                                        
                                                        
                                                        self.inviteFrndsModel.isInvited = Int(friendStatus)!

                                                    }
                                                    
                                                   
                                                    self.inviteFrndsArray.append(self.inviteFrndsModel)

                                                    
                                                }
                                                
                                                
                                                NSOperationQueue.mainQueue().addOperationWithBlock
                                                    {
                                                        
                                                        
                                                        
                                                        
                                                        if self.view.subviews.contains(self.noInternet.view)
                                                            
                                                        {
                                                            
                                                            for i in self.view.subviews
                                                                
                                                            {
                                                                
                                                                if i == self.noInternet.view
                                                                    
                                                                {
                                                                    
                                                                    i.removeFromSuperview();
                                                                    
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                        
                                                        
                                                        if self.view.subviews.contains(self.noFriendResult.view)
                                                            
                                                        {
                                                            
                                                            for i in self.view.subviews
                                                                
                                                            {
                                                                
                                                                if i == self.noFriendResult.view
                                                                    
                                                                {
                                                                    
                                                                    i.removeFromSuperview();
                                                                    
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                        
                                                        if self.view.subviews.contains(self.error.view)
                                                            
                                                        {
                                                            
                                                            for i in self.view.subviews
                                                                
                                                            {
                                                                
                                                                if i == self.error.view
                                                                    
                                                                {
                                                                    
                                                                    i.removeFromSuperview();
                                                                    
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                        
                                                        self.activityIndicator.stopAnimating();
                                                        
                                                        self.loadingView.removeFromSuperview();
                                                        
                                                        
                                                        self.InviteFriendsTableView.delegate = self;
                                                        
                                                        self.InviteFriendsTableView.dataSource = self;
                                                        self.InviteFriendsTableView.reloadData();
                                                        
                                                        
                                                        
                                                }

                                                
                                            }
                                            
                                        } // friendList close

                                        
                                        
//                                        if let emailList = elements[i]["emailList"]
//                                        {
//                                            
//                                            
//                                            if   emailList  != nil
//                                            {
//                                                //self.amenitiesName.removeAll();
//                                        
//                                                
//                                                for var i = 0; i<emailList!.count; i++
//                                                {
//                                                    
//                                                    
//                                                    
//                                                    
//                                                    
//                                                }
//                                                
//                                                
//                                                
//                                            }
//                                            
//                                        } // emailList close
//                                        
                                        

                                        
                                        
                                   ////// }
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                            }
                                
                                
                        } // ns close
                        
                        
                        
                        
                    }
                        
                    else if status == "Error"
                        
                    {
                        
                                NSOperationQueue.mainQueue().addOperationWithBlock{
                                        
                                        self.activityIndicator.stopAnimating();
                                        
                                        self.loadingView.removeFromSuperview();
                                        
                                        
                                        if self.view.subviews.contains(self.noInternet.view)
                                            
                                        {
                                            
                                            for i in self.view.subviews
                                                
                                            {
                                                
                                                if i == self.noInternet.view
                                                    
                                                {
                                                    
                                                    i.removeFromSuperview();
                                                    
                                                    
                                                }
                                                
                                            }
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        if self.view.subviews.contains(self.noFriendResult.view)
                                            
                                        {
                                            
                                            for i in self.view.subviews
                                                
                                            {
                                                
                                                if i == self.noFriendResult.view
                                                    
                                                {
                                                    
                                                    i.removeFromSuperview();
                                                    
                                                    
                                                }
                                                
                                            }
                                            
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                        if self.view.subviews.contains(self.error.view)
                                            
                                        {
                                            
                                            //  self.noInternet.imageView.image = UIImage(named: "im_no_internet");
                                            
                                        }
                                            
                                        else
                                            
                                        {
                                            
                                            self.error = self.storyboard?.instantiateViewControllerWithIdentifier("errorViewController") as! errorViewController
                                            
                                            self.error.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60);
                                            
                                            self.view.addSubview((self.error.view)!);
                                            
                                            //  self.DIVC.imageView.image = UIImage(named: "im_no_internet");
                                            
                                            // self.noInternet.imageView.userInteractionEnabled = true
                                            
                                            
                                            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(InviteFriendsViewController.handleTap(_:)))
                                            
                                            
                                            self.view.userInteractionEnabled = true
                                            
                                            // self.noInternet.noInternetLabel.userInteractionEnabled = true
                                            
                                            
                                            self.error.view.addGestureRecognizer(tapRecognizer)
                                            
                                            self.error.didMoveToParentViewController(self)
                                            
                                        }
                                        
                                        
                                }
                                
                      
                        
                    } /// error close
                    
                    else if status == "NoResult"
                        
                    {
                        
                        NSOperationQueue.mainQueue().addOperationWithBlock{
                                
                                
                                
                                self.activityIndicator.stopAnimating();
                                
                                self.loadingView.removeFromSuperview();
                                
                                
                                
                                ///// removeing image views
                                
                                if self.view.subviews.contains(self.noInternet.view)
                                    
                                {
                                    
                                    for i in self.view.subviews
                                        
                                    {
                                        
                                        if i == self.noInternet.view
                                            
                                        {
                                            
                                            i.removeFromSuperview();
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                if self.view.subviews.contains(self.error.view)
                                    
                                {
                                    
                                    for i in self.view.subviews
                                        
                                    {
                                        
                                        if i == self.error.view
                                            
                                        {
                                            
                                            i.removeFromSuperview();
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                                
                                if self.view.subviews.contains(self.noFriendResult.view)
                                    
                                {
                                    
                                    //  self.noInternet.imageView.image = UIImage(named: "im_no_internet");
                                    
                                }
                                    
                                else
                                    
                                {
                                    
                                    self.noFriendResult = self.storyboard?.instantiateViewControllerWithIdentifier("NoFriendViewController") as! NoFriendViewController
                                    
                                    self.noFriendResult.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100);
                                    
                                    self.view.addSubview((self.noFriendResult.view)!);
                                  
                                    
                                    self.noFriendResult.didMoveToParentViewController(self)
                                    
                                }
                                
                                
                                
                                
                        }
                        
                    }

                }
                
            }
                
            catch
                
            {
                
                
                
                self.activityIndicator.stopAnimating();
                
                self.loadingView.removeFromSuperview();
                
                let alert = UIAlertController(title: "", message:"something went wrong try again later." , preferredStyle: UIAlertControllerStyle.Alert)
                
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
                
                alert.addAction(alertAction)
                
                let alertAction2 = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {
                    
                    Void in self.inviteFriends();
                    
                })
                
                alert.addAction(alertAction2)
                
                
                
                self.presentViewController(alert, animated: true, completion: nil)
                
                
                
                
                print(error)
                
            }
            
        } // if dataTask close
        

        
        
    } //// main func
    
    //MARK:- NO INTERNET TAP GESTURE
    
    func handleTap(sender: UITapGestureRecognizer)
    {
        
        if(Reachability.isConnectedToNetwork()==true )
        {
            
            inviteFriends();
            
        }
        
        
        
    }
    

    
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
        
        
        self.activityIndicator.stopAnimating();
        
        self.loadingView.removeFromSuperview();
        
        // LoaderFile.hideLoader(self.view)
        
        let alert = UIAlertController(title: "", message:"something went wrong try again later." , preferredStyle: UIAlertControllerStyle.Alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(alertAction)
        
        let alertAction2 = UIAlertAction(title: "Retry", style: UIAlertActionStyle.Default, handler: {
            
            Void in self.inviteFriends();
            
        })
        
        alert.addAction(alertAction2)
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
    }

////////////////////////////////////
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == searchTextField
        {
            textField.resignFirstResponder();
            
        }
        return true;
    }
    

    
    override func viewDidAppear(animated: Bool)
    {
        
      print(EmailIds)
        
        for var i = 0; i<EmailIds.count; i++
         {
            
            inviteEmailModel = inviteFriendsModel()
            
            inviteEmailModel.InviteEmails = EmailIds[i]
            
            self.inviteEmailArray.append(self.inviteEmailModel);
         }
        
        
        print(inviteEmailArray.count)
        
        print(inviteEmailModel.InviteEmails)
        
        self.InviteFriendsTableView.delegate = self;
        self.InviteFriendsTableView.dataSource = self;
        self.InviteFriendsTableView.reloadData();
    }

    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        
    
        
        EmailContacts = [];
        
        // NSUserDefaults.standardUserDefaults().setObject(msg, forKey: "successMsgOfAddViaEmail")
        
        
        self.getChallengeFriendlist();
        
     
        self.searchTextField.delegate = self;
        self.searchTextField.autocorrectionType = .No
       
        InviteFriendsTableView.separatorColor = UIColor.grayColor()
        InviteFriendsTableView.tableFooterView = UIView()
        
        
        inviteButton.layer.cornerRadius = 2
        inviteButton.clipsToBounds = true;
        
        
        //MARK:-  padding views
        
        ///////// padding views in text fileds
        
        let paddingView1 = UIView(frame: CGRectMake(0, 0, 25, self.searchTextField.frame.height))
        searchTextField.leftView = paddingView1
        searchTextField.leftViewMode = UITextFieldViewMode.Always
        
        
        //MARK:-  placeholder in text fileds

        
        let placeholder1 = NSAttributedString(string: "Search", attributes: [NSForegroundColorAttributeName:UIColor(red: 139/255, green: 139/255, blue: 139/255, alpha: 1)])
        searchTextField.attributedPlaceholder = placeholder1


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
