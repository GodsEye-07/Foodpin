//
//  reviewViewController.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 10/06/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class reviewViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var restaurant :Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let restaurant = restaurant{
            restaurantImageView.image = UIImage(named: restaurant.image)
        }
        
        // adding the blur effect to the background
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // sizing down the container to 0
        containerView.transform =  CGAffineTransform.init(scaleX: 0, y: 0)
        closeButton.transform = CGAffineTransform.init(translationX: 1000, y: 0)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        // setting the view back to the normal ratio by using the identity property which makes all the view back to the orignal set form
        
        // normal growing animation
        
      UIView.animate(withDuration: 0.5, animations: { 
        self.containerView.transform = CGAffineTransform.identity
      }) { (true) in
            UIView.animate(withDuration: 0.3, animations: { 
                self.closeButton.transform = CGAffineTransform.identity
            })
        }
        
        
        
        
        // spring animation
//        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
//                        self.containerView.transform = CGAffineTransform.identity
//        }, completion: nil)
        
        // slide down animation
//        UIView.animate(withDuration: 0.3) {
//            self.containerView.transform = CGAffineTransform.identity
//        }

        
        //concatinating two animations
//        let transform1 = CGAffineTransform.init(scaleX: 0, y: 0)
//        let translateTransform = CGAffineTransform.init(translationX: 0, y: 0)
//        let combineTransform = transform1.concatenating(translateTransform)
//        containerView.transform = combineTransform

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

// end of the class
}
