//
//  Carousel.swift
//  generic
//
//  Created by f0go on 11/4/15.
//  Copyright © 2015 f0go. All rights reserved.
//

import Foundation
import UIKit

class Carousel: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var images: [String] = []
    
    var closeCallback: (() -> Void)?
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.2, animations: {
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
            self.collection.alpha = 1
        })
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CarouselCell", forIndexPath: indexPath) as! CarouselCell
        cell.image.image = nil
        cell.spinner.startAnimating()
        let imageURL = images[(indexPath as NSIndexPath).row]
        Utils.getImageFromUrl(imageURL, callback: { (image) -> Void in
            cell.image.image = image
            cell.spinner.stopAnimating()
        })
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var ret:CGSize!
        
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
        ret = flowlayout.itemSize
        
        ret.width = Utils.screenSize.width
        ret.height = Utils.screenSize.height
        
        return ret
    }
    
    @IBAction func close(sender: AnyObject) {
        closeCarousel()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -30 || scrollView.contentOffset.y > 30 {
            closeCarousel()
        }
    }
    
    func closeCarousel() {
        if (closeCallback != nil) {
            closeCallback!()
        }
    
        UIView.animateWithDuration(0.2, animations: {
            self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            self.collection.alpha = 0
        }) { (bool) in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
