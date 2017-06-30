//
//  AddRestaurantController.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 15/06/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var restaurantTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                
                present(imagePicker, animated: true, completion: nil)
                imagePicker.delegate = self
            }
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
            //updating the constraints programically as soon as the image is upladed
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute:
        NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem:
        photoImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1,constant: 0)
    leadingConstraint.isActive = true
    
    let trailingConstraint = NSLayoutConstraint(item: photoImageView,attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal,toItem: photoImageView.superview, attribute: NSLayoutAttribute.trailing,multiplier: 1, constant: 0)
    trailingConstraint.isActive = true
    
    let topConstraint = NSLayoutConstraint(item: photoImageView, attribute:
        NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem:
        photoImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1,constant: 0)
    topConstraint.isActive = true
    
    let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute:
        NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem:
        photoImageView.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1,constant: 0)
    bottomConstraint.isActive = true
    dismiss(animated: true, completion: nil)
        
}
    
    @IBAction func saveData(_ sender: Any) {
        
        print("\(restaurantTextField.text!)")
        print("\(locationTextField.text!)")
        print("\(typeTextField.text!)")
        
        if (restaurantTextField.text! == "") || (locationTextField.text! == "") || (typeTextField.text! == ""){
            
            let alertMessage = UIAlertController(title: "Oops !", message: "One of the fields has been left empty, We cannot proceed if any field is left Empty", preferredStyle: .alert)
            let alert = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertMessage.addAction(alert)
            present(alertMessage, animated: true, completion: nil)
        
        }
    }
    
    @IBAction func yesBtnPressed(_ sender: Any) {
        
        yesBtn.backgroundColor = UIColor(red: 220.0/255.0, green: 100.0/255.0, blue: 64.0/255.0, alpha: 1.0)
        noBtn.backgroundColor = UIColor.gray
        
    }
    
    @IBAction func noBtnPressed(_ sender: Any){
        
        yesBtn.backgroundColor = UIColor.gray
        noBtn.backgroundColor = UIColor(red: 220.0/255.0, green: 100.0/255.0, blue: 64.0/255.0, alpha: 1.0)
    
    }
    
    
// end of the class
}
