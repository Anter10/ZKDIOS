//
//  RegistereView.swift
//  ZKDIOS
//
//  Created by 郭有超 on 2018/1/28.
//  Copyright © 2018年 郭有超. All rights reserved.
//

import UIKit
import WebKit;
class RegistereView: UIViewController {

    var aboutWebView = WKWebView();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theConfiguration = WKWebViewConfiguration()
        
        aboutWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 0), configuration: theConfiguration)
        
        
        let aboutUrl = NSURL(string: "http://192.168.1.140:8080/AZkd/register/register.jsp")!
        aboutWebView.scrollView.bounces = false
        aboutWebView.scrollView.isScrollEnabled = false
        let request = NSURLRequest(url: aboutUrl as URL)
        aboutWebView.load(request as URLRequest)
        self.view.addSubview(aboutWebView)
        // Do any additional setup after loading the view.
        let IdLabel = UIButton(frame: CGRect(x:0, y: UIScreen.main.bounds.height - 40, width:UIScreen.main.bounds.width, height: 30))
        IdLabel.titleLabel?.textColor = UIColor.blue
        IdLabel.titleLabel?.font = UIFont(name: "Arial", size: 14)
        IdLabel.setTitle("返回登陆", for: UIControlState.normal)
        IdLabel.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(IdLabel)
        IdLabel.addTarget(self, action:#selector(loginCall(_:)), for:.touchUpInside)
        
       
        
    }
    
    // 登录服务器
    @objc func loginCall(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

