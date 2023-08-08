//
//  ViewController2.swift
//  api4
//
//  Created by vivek katariya on 07/08/23.
//

import UIKit

class ViewController2: UIViewController {
  var web = String()
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        webView.loadRequest(URLRequest(url: URL(string: web)!))
        
    }
}
