//
// BaseViewController.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.
	

import UIKit

class BaseViewController: UIViewController {
       
       var progressIndicator: UIActivityIndicatorView = {
           let ac = UIActivityIndicatorView()
           return ac
       }()
       
       var views: [UIView] { [] }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           configureViews()
           setObservers()
       }
       
       func configureViews() {}
       
       func createProgressBar() {
           view.addSubview(progressIndicator)
           progressIndicator.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
           progressIndicator.hidesWhenStopped = true
           progressIndicator.center = view.center
           if #available(iOS 13.0, *) {
               progressIndicator.color = .systemIndigo
               progressIndicator.style = .large
           }
       }
       
       func showLoading() {
           hideLoading()
           createProgressBar()
           progressIndicator.startAnimating()
           views.forEach {
               $0.isUserInteractionEnabled = false
               $0.alpha = 0.85
           }
       }
       
       func hideLoading() {
           progressIndicator.stopAnimating()
           views.forEach {
               $0.isUserInteractionEnabled = true
               $0.alpha = 1
           }
       }
       
       func setObservers() {
           setChildViewControllerObservers()
       }
       
       func setChildViewControllerObservers() {}

}
