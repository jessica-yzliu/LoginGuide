//
//  ViewController.swift
//  LoginGuide
//
//  Created by yanze on 9/13/16.
//  Copyright © 2016 yanzeliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .orangeColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        // use autolayout
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
   
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
        
        cell.backgroundColor = .whiteColor()
        return cell
        
    }
    
    // define cell size to the full screen size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }




}

extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraintEqualToAnchor(top, constant: topConstant).active = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraintEqualToAnchor(bottom, constant: -bottomConstant).active = true
        }
        
        if let left = left {
            leftAnchor.constraintEqualToAnchor(left, constant: leftConstant).active = true
        }
        
        if let right = right {
            rightAnchor.constraintEqualToAnchor(right, constant: -rightConstant).active = true
        }
        
    }
}

