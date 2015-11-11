//
//  ViewController.swift
//  SaveImages
//
//  Created by Anjel Villafranco on 11/11/15.
//  Copyright © 2015 Anjel Villafranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var savedImages: [String] = []
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBAction func pressedCapture(sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        defer { picker.dismissViewControllerAnimated(true, completion: nil) }
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        
        let s3manager = AFAmazonS3Manager(accessKeyID: accessID, secret: secretKey)
        
        s3manager.requestSerializer.bucket = "anjel.villafranco"
        s3manager.requestSerializer.region = AFAmazonS3USStandardRegion
        
        
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory , .UserDomainMask, true)
        
        let filePath = paths[0] + "/image.png"

        UIImagePNGRepresentation(image)?.writeToFile(filePath, atomically: true)
        
        
        s3manager.postObjectWithFile(filePath, destinationPath: "image.png", parameters: nil, progress: { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) -> Void in
            
            let percent = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
            
            print("loaded \(percent)")
            
            }, success: { (response) -> Void in
                
            }) { (error) -> Void in
                
                print(error)
                
        }
        //save image to S3
        //get URLs and add the array URLs
        //tell collectionView to reload
        
       
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return savedImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath)
        
        for v in cell.contentView.subviews {
            
            v.removeFromSuperview()
            
        }
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        
        cell.contentView.addSubview(imageView)
        
        return cell
    }
    
}




















