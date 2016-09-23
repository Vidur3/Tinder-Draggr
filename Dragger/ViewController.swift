//
//  ViewController.swift
//  Dragger
//
//  Created by Vidur Singh on 07/09/16.
//  Copyright © 2016 Vidur Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(_:)))
        image.addGestureRecognizer(gesture)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func wasDragged(gesture: UIPanGestureRecognizer) {
        
        
        let translation = gesture.translationInView(self.view)
        var img = gesture.view!
        
        
        img.center = CGPoint(x: self.view.bounds.width/2 + translation.x, y: self.view.bounds.height/2 + translation.y)
        
        let xfromCenter = img.center.x - self.view.bounds.width/2
        
        var rotation = CGAffineTransformMakeRotation(xfromCenter/200)
        
        let scale = min(100/abs(xfromCenter),1)
        
        var stretch = CGAffineTransformScale(rotation, scale, scale)
        
        img.transform = stretch
        
        if gesture.state == UIGestureRecognizerState.Ended {
            
            if img.center.x < 100 {
                
                print("Not Chosen")
                
            } else if img.center.x > 100 {
                
                print("chosen")
            }
            
            img.center = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            
            rotation = CGAffineTransformMakeRotation(0)
            
            stretch = CGAffineTransformScale(rotation, 1, 1)
            
            img.transform = stretch
            
        }
        
    }


}

