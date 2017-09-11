//
//  ImageViewController.swift
//  AutoLayoutAndSizeClasses
//
//  Created by Lucas Pelizza on 9/11/17.
//  Copyright © 2017 Lucas Pelizza. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView!
    let imageName = "panoramic"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView = UIImageView()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if imageView.image == nil {
            if let image = UIImage(named: imageName) {
                imageView.image = image
                imageView.sizeToFit()
                scrollView.contentSize = image.size
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        resetZoomScale()
    }
    
    func resetZoomScale() {
        guard let image = imageView.image else { return }
        
        var zoomScale: CGFloat = 1.0
        var contentOffset = CGPoint.zero
        
        if traitCollection.verticalSizeClass == .compact {
            zoomScale = view.frame.width / image.size.width
            let verticalSpace = (view.frame.height - (image.size.height * zoomScale) ) / 2
            contentOffset = CGPoint(x: 0, y: -verticalSpace)
            scrollView.isScrollEnabled = false
        } else {
            zoomScale = view.frame.height / image.size.height
            scrollView.isScrollEnabled = true
        }
        
        scrollView.minimumZoomScale = zoomScale
        scrollView.maximumZoomScale = zoomScale
        scrollView.zoomScale = 0.2//zoomScale
        scrollView.contentOffset = contentOffset
    }
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

