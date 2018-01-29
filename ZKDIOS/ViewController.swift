//
//  ViewController.swift
//  ZKDIOS
//
//  Created by 郭有超 on 2018/1/27.
//  Copyright © 2018年 郭有超. All rights reserved.
//

import UIKit
import WebKit;

class ViewController: UIViewController {
    var aboutWebView = WKWebView();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let theConfiguration = WKWebViewConfiguration()
        
        aboutWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 0), configuration: theConfiguration)
        
        
        let aboutUrl = NSURL(string: "http://192.168.1.140:8080/AZkd/AppStartInfo/appstart.jsp")!
        aboutWebView.scrollView.bounces = false
        let request = NSURLRequest(url: aboutUrl as URL)
        aboutWebView.load(request as URLRequest)
        self.view.addSubview(aboutWebView)
        
        Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(ViewController.cuttime(timer:)), userInfo: nil, repeats: false)
    }

    @objc func cuttime(timer: Timer) {
        // 计时开始时，逐秒减少remainingSeconds的值
        let setpwd = LoginView()
        print("当前的时间 = ")
        self.show(setpwd, sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

