//
//  LoadingView.swift
//  Marvel Challenge
//
//  Created by Antonio on 30/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var parentView: UIView?
    
    init(parentView: UIView) {
        self.parentView = parentView
        super.init(frame: parentView.frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        self.backgroundColor = UIColor.lightGray
        self.alpha = 0.8
        
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.startAnimating()
        
        self.addSubview(activityIndicator)
        self.parentView!.addSubview(self)
    }
    
    func showLoadingView() {
        self.isHidden = false
    }
    
    func hideLoadingView() {
        self.isHidden = true
    }
}
