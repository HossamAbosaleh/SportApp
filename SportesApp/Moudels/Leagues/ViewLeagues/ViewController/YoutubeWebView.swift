//
//  YoutubeWebView.swift
//  SportesApp
//
//  Created by Abo Saleh on 6/24/22.
//  Copyright © 2022 Abo Saleh. All rights reserved.
//

import UIKit
import WebKit


class YoutubeWebView: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var webViewForYoutube: WKWebView!
    
    var linkString : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://\(linkString)")
        if let url = url {
            webViewForYoutube.load(URLRequest(url: url))
            webViewForYoutube.navigationDelegate = self
            webViewForYoutube.allowsBackForwardNavigationGestures = true
        }
        
    }
    

}


