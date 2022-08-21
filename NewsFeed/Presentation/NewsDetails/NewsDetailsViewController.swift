//
// NewsDetailsViewController.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 20/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit
import WebKit

class NewsDetailsViewController: BaseViewController {
    
    var news: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if let news = news, let url = news.url {
            self.showWebview(urlString: url)
        }
    }
    
    fileprivate func showWebview(urlString: String) {
        lazy var webview: WKWebView = {
            let webview = WKWebView(frame: .zero)
            webview.translatesAutoresizingMaskIntoConstraints = false
            webview.allowsBackForwardNavigationGestures = true
            webview.allowsLinkPreview = true
            return webview
        }()
        
        self.view.addSubview(webview)
        webview.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, margin: .init(top: 0, left: 0, bottom: 0, right: 0))
        let urlString = urlString
        guard let url = URL(string: urlString) else {
            Logger.printIfDebug(data: "unable to get url", logType: .error)
            return
        }
        webview.navigationDelegate = self
        webview.load(URLRequest(url: url))
    }
    
}

extension NewsDetailsViewController: WKNavigationDelegate {}
