//
//  SIFiguresViewController.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/16/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

let SIFadeAnimationDuration: NSTimeInterval = 1.0

class SIInteractionViewController: SIBaseViewController {
    
    let tempImageURLPath = "http://lorempixel.com/400/200/"

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadImage()
    }
    
    private func loadImage() {
        let imageURL = NSURL(string: self.tempImageURLPath)
        self.imageView.pin_setImageFromURL(imageURL, placeholderImage: nil) {[weak self] (result: PINRemoteImageManagerResult!) -> Void in
            if let weakSelf = self {
                weakSelf.imageView.alpha = 0.0
                UIView.animateWithDuration(SIFadeAnimationDuration, animations: { () -> Void in
                    weakSelf.imageView.alpha = 1.0
                })
            }
        }
    }

    @IBAction func reloadButtonTapped(sender: AnyObject) {
        PINCache.sharedCache().removeAllObjects()
        self.imageView.image = nil
        self.loadImage()
    }

}
