//
//  AboutViewController.swift
//  BullsEye
//
//  Created by vikas kumar on 08/01/19.
//  Copyright © 2019 vikas kumar. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet
    private weak var webView:WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let uri = URL.init(fileURLWithPath: htmlPath)
            let request = URLRequest.init(url: uri)
            webView.load(request)
        }
    }
    
    @IBAction func closeAbout(_ close:UIButton){
        dismiss(animated: true, completion: nil)
    }
}
