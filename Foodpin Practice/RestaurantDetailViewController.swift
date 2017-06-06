//
//  RestaurantDetailViewController.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 30/05/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    var restaurant:Restaurant!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurant.image)
        
        
        // adding a slight background colour
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        
        
        // to change the tableView seperator and change its color
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        // to remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // to give the name in the navigation bar of the specific restaurant
        title = restaurant.name
        
               
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestuarantDetailTableViewCell
        
        // configure the cell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Been Here"
            cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I have been Here Before" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        return cell
        
    }

  


}
