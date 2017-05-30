//
//  RestaurantViewController.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 29/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    var restaurantNames = ["cafe Deadend" , "Homei" , "Teakha" , "Cafe Loisl"," Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jgp" ,"homei.jgp" , "teakha.jpg" , "cafeloisl.jpg","petiteoyster.jpg","forkeerestaurant.jpg","posatelier.jpg","bourkestreetbakery.jpg","haighschocolate.jpg","palominoespresso.jpg","upstate.jpg","traif.jpg","grahamavenuemeats.jpg","wafflewolf.jpg","fiveleaves.jpg","cafelore.jpg","confessional.jpg","barrafina.jpg","donostia.jpg","royaloak.jpg","caskpubkitchen.jpg"]

    var restaurantLocation = ["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","sydney","sydney","sydney","New York","New York","New York","New York","New York","New York","New York","London","London","London","London"]
    
    var restaurantTypes = ["Coffee & Tea Shop","Cafe","Tea House","Autrian / Casual Drink","French","Bakery","Bakery","Chocolate","Cafe","American / Seafood","American","American","Breakfast & Brunch","Coffee & Tea","Coffee & Tea","Coffee & Tea","Latin American","Spanish","Spanish","Spanish","British","Thai"]
    
    var restaurantIsVisited = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! restaurantsTableViewCell
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnaiImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        // this part of the code makes the thumbnail image circular
        cell.thumbnaiImageView.layer.cornerRadius = 30.0
        cell.thumbnaiImageView.clipsToBounds = true
        
        cell.locationLabel.text = restaurantLocation[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        
        if restaurantIsVisited[indexPath.row] == true{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }
        
        
        return cell
        
        
    }
    
    
    // to create the alert box
    
    // function inside the tableViewCell is created as Override not to change the functions of the tableView
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // create an optional menu as an (action sheet or as an alert)
        let optionMenu = UIAlertController(title: nil, message : "What do you want to do?", preferredStyle: .actionSheet)
        
        // add action to the menu
        let cancelAction = UIAlertAction(title: "Cancel" ,style: .cancel , handler: nil )
        optionMenu.addAction(cancelAction)
        
        // display the menu
        present(optionMenu, animated: true, completion: nil)
        
        
        
        
        // add call action
        let callActionHandler = {(ACTION: UIAlertAction!) -> Void in
        
            let alertMessage = UIAlertController(title:"Call Service Unavailable", message:"Please try after some time", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated:true, completion: nil)
            
        }
        
        let callAction = UIAlertAction(title: "Call" + " 123-000-\(indexPath.row)",style :.default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        // add message action
        let messageHandler = {(ACTION: UIAlertAction!) -> Void in
            
            let alertMess = UIAlertController(title:"Message Service Unavailable", message:"Please try after some time", preferredStyle: .alert)
            
            alertMess.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMess, animated:true, completion: nil)
            
        }
        let messageAction = UIAlertAction(title: "Message" + " 123-000-\(indexPath.row)",style :.default, handler: messageHandler)
        optionMenu.addAction(messageAction)

        
        
        // check in action
        let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check In" : "Check In"
        let checkInAction = UIAlertAction(title: checkInTitle ,style: .default ,handler: {
            
            (ACTION : UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at:indexPath)
            
            
            // checks if the restaurantIVisited is true or not if true then make it false
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none

        })
        optionMenu.addAction(checkInAction)

        // end of didSelectRowAt
        }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            
            // delete all the elements in the cell of a table view individually
            restaurantNames.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantLocation.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
        
        }
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // social sharing action
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default , title:"Share" ,handler: {(ACTION, indexPath) -> Void in
            
                let defaultText = "Just Check In At " + self.restaurantNames[indexPath.row]
          
            
            // to add image also to sharing
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
            
               let activityController = UIActivityViewController(activityItems:[defaultText,imageToShare],applicationActivities: nil)
                
                        self.present(activityController, animated: true, completion: nil)
            
            } 
        })
        
        
        
        
        // delete action
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title:"Delete",handler :{(ACTION,indexPath) ->Void in
        
                // delete the row from the data source
                self.restaurantNames.remove(at: indexPath.row)
                self.restaurantLocation.remove(at: indexPath.row)
                self.restaurantTypes.remove(at: indexPath.row)
                self.restaurantIsVisited.remove(at: indexPath.row)
                self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        
        })
        
         shareAction.backgroundColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        
        deleteAction.backgroundColor = UIColor(red: 245.0/255.0, green: 215.0/255.0, blue: 110.0/255.0, alpha: 1.0)

        
        return [deleteAction,shareAction]
        
       
    }
    
    
    
// end of the ViewController Class
  }
