//
//  RestaurantViewController.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 29/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    
var restaurants:[Restaurant] = [
    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
    Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
    Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
    Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
    Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
    Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
    Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
    Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
    Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
    Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
    Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
    Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
    Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
    Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
    Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
    Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
    Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg", isVisited: false),
    Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
    Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen.jpg", isVisited: false)
]

 override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
}

 override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

// MARK: - Table view data source

 override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurants.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cellIdentifier = "cell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! restaurantsTableViewCell
    
    // Configure the cell...
    cell.nameLabel.text = restaurants[indexPath.row].name
    cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
    cell.locationLabel.text = restaurants[indexPath.row].location
    cell.typeLabel.text = restaurants[indexPath.row].type
    
    cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
    
    cell.thumbnailImageView.layer.cornerRadius = 35.0
    cell.thumbnailImageView.clipsToBounds = true
    
    return cell
}


override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
        // Delete the row from the data source
        restaurants.remove(at: indexPath.row)
    }
    
    tableView.deleteRows(at: [indexPath], with: .fade)
}

 override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
    // Social Sharing Button
    let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, indexPath) -> Void in
        
        let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
        
        if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
            let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
    })
    
    // Delete button
    let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete",handler: { (action, indexPath) -> Void in
        
        // Delete the row from the data source
        self.restaurants.remove(at: indexPath.row)
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    })
    
    shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
    deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
    
    return [deleteAction, shareAction]
}


 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showRestaurantDetail" {
        if let indexPath = tableView.indexPathForSelectedRow {
            let destinationController = segue.destination as! RestaurantDetailViewController
            destinationController.restaurant = restaurants[indexPath.row]
        }
    }
}
    

    
// end of the class
}




