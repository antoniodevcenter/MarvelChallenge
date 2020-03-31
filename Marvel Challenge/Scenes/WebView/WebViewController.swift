//
//  WebViewController.swift
//  Marvel Challenge
//
//  Created by Antonio on 31/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url: String?
    var loadingView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: url!)
        let myRequest = URLRequest(url: myURL!)
        webView.navigationDelegate = self
        webView.load(myRequest)
        loadingView = LoadingView(parentView: self.view)
        setToolBar()
    }
    
    func configureWith(url: String) {
        self.url = url
    }
    
    fileprivate func setToolBar() {
        let screenWidth = self.view.bounds.width
        let backButton = UIBarButtonItem(title: "Back".localized(), style: .plain, target: self, action: #selector(goBack))
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        
        toolBar.isTranslucent = false
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.items = [backButton]
        webView.addSubview(toolBar)
        
        // Constraints
        toolBar.bottomAnchor.constraint(equalTo: webView.bottomAnchor, constant: 0).isActive = true
        toolBar.leadingAnchor.constraint(equalTo: webView.leadingAnchor, constant: 0).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: webView.trailingAnchor, constant: 0).isActive = true
      }
      @objc private func goBack() {
        if webView.canGoBack {
          webView.goBack()
        } else {
          self.dismiss(animated: true, completion: nil)
        }
      }

}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView?.hideLoadingView()
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loadingView?.showLoadingView()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        loadingView?.hideLoadingView()
    }
}
