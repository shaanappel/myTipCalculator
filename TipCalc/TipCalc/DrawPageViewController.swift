//
//  DrawPageViewController.swift
//  TipCalc
//
//  Created by Shaan Appel on 2/14/16.
//  Copyright © 2016 Shaan Appel. All rights reserved.
//

import UIKit

class DrawPageViewController: UIViewController {
    
    var lastPoint:CGPoint!
    var isSwiping:Bool!
    var red:CGFloat!
    var green:CGFloat!
    var blue:CGFloat!
    
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func clearImage(sender: AnyObject) {
        
        self.imageView.image = nil
    }
    
    @IBAction func saveImage(sender: AnyObject) {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image!,self, Selector("image:withPotentialError:contextInfo:"), nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        red = CGFloat(100.0/255.0)
        green = CGFloat(100.0/255.0)
        blue  = CGFloat(100.0/255.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
            isSwiping    = false
            if let touch = touches.first {
                lastPoint = touch.locationInView(imageView)
            }
    }
    
    override func touchesMoved(touches: Set<UITouch>,
        withEvent event: UIEvent?){
            
            isSwiping = true;
            if let touch = touches.first {
                let currentPoint = touch.locationInView(imageView)
                UIGraphicsBeginImageContext(self.imageView.frame.size)
                self.imageView.image?.drawInRect(CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height))
                CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
                CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y)
                CGContextSetLineCap(UIGraphicsGetCurrentContext(),.Round)
                CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 9.0)
                CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(),red, green, blue, 1.0)
                CGContextStrokePath(UIGraphicsGetCurrentContext())
                self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                lastPoint = currentPoint
            }
    }
    
    override func touchesEnded(touches: Set<UITouch>,
        withEvent event: UIEvent?){
            if(!isSwiping) {
                UIGraphicsBeginImageContext(self.imageView.frame.size)
                self.imageView.image?.drawInRect(CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height))
                CGContextSetLineCap(UIGraphicsGetCurrentContext(), .Round)
                CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 9.0)
                CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0)
                CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
                CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y)
                CGContextStrokePath(UIGraphicsGetCurrentContext())
                self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            }
    }
    
    func image(image: UIImage, withPotentialError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        UIAlertView(title: nil, message: "Image successfully saved to Photos library", delegate: nil, cancelButtonTitle: "Dismiss").show()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
