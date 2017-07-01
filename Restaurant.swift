//
//  Restaurant.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 05/06/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var image = ""
    var phoneNumber = ""
    var isVisited = false
    var rating = ""
    
    
    init(name: String, type: String, location: String, image: String, phoneNumber: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.phoneNumber = phoneNumber
        self.isVisited = isVisited
    }
    
}
