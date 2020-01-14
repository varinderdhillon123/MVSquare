//
//  ViewController.swift
//  MVSquare
//
//  Created by MacStudent on 2020-01-13.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func slider(_ sender: UISlider)
    {
     switch sender.value{
               case 0:
                   speed = 1.2
                   print(speed)
                   break
               case 1:
                   speed = 1.0
                   print(speed)
                   break
               case 2:
                   speed = 0.8
                   break
               case 3:
                   speed = 0.6
                       break
               case 4:
                   speed = 0.4
                   
               default:
                   speed = 0.1
               }
           }
           
    @IBOutlet weak var sliderone: UISlider!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var sliderlbl: UILabel!
    var timer: Timer!
     var c = 0
    var speed = 0.1
    override func viewDidLoad() {
        super.viewDidLoad()
       lblCount.text = "\(c)"
          let mainViewHeight = view.frame.size.height
            let mainViewWidth = view.frame.size.width
            var myViewHeight = self.myView.frame.size.height
            var myViewWidth = self.myView.frame.size.width
            myView.center = view.center
            myView.backgroundColor = .red
        
        var timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
             { timer in
                self.myView.backgroundColor = .random()
             }
            expand()
            }
         
           
          func expand(){
            var timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true)
            { timer in
                  self.myView.backgroundColor = .random()
                       print("Expand by\(timer)")
            self.myView.frame.origin.x -= 5
            self.myView.frame.origin.y -= 5
            self.myView.frame.size.height += 10
            self.myView.frame.size.width += 10
            if(self.myView.frame.size.width == 390)
            {
              timer.invalidate()
              self.shrink()
            }
            }
            
          }
    func shrink(){
        
    
          
           var timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true)
           { timer in
             self.myView.backgroundColor = .random()
                   print("Expand by\(timer)")
            self.myView.frame.origin.x += 5
            self.myView.frame.origin.y += 5
            self.myView.frame.size.height -= 10
            self.myView.frame.size.width -= 10
            if(self.myView.frame.size.width == 50)
            {
               timer.invalidate()
              self.expand()
                self.c+=1
                self.lblCount.text = "\(self.c)"

                 
            }
          }
          }
        }

        extension UIColor {
          static func random() -> UIColor {
            func random() -> CGFloat { return .random(in:0...1) }
            return UIColor(red:  random(),
                    green: random(),
                    blue: random(),
                    alpha: 1.0)
          }
        }
