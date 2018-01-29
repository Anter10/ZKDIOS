//
//  LoginView.swift
//  ZKDIOS
//
//  Created by 郭有超 on 2018/1/27.
//  Copyright © 2018年 郭有超. All rights reserved.
//

import UIKit
import WebKit;

class LoginView: UIViewController {
    var aboutWebView = WKWebView();
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.delegate?.window??.rootViewController = self
        let theConfiguration = WKWebViewConfiguration()
        
        aboutWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 0), configuration: theConfiguration)
        
        
        let aboutUrl = NSURL(string: "http://192.168.1.140:8080/AZkd/login/loginview.jsp")!
        aboutWebView.scrollView.bounces = false
        aboutWebView.scrollView.isScrollEnabled = false
        let request = NSURLRequest(url: aboutUrl as URL)
        aboutWebView.load(request as URLRequest)
        self.view.addSubview(aboutWebView)
        // Do any additional setup after loading the view.
        let IdLabel = UIButton(frame: CGRect(x:1, y: UIScreen.main.bounds.height - 40, width: 60, height: 30))
        IdLabel.titleLabel?.textColor = UIColor.blue
        IdLabel.titleLabel?.font = UIFont(name: "Arial", size: 14)
        IdLabel.setTitle("注册", for: UIControlState.normal)
        IdLabel.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(IdLabel)
        IdLabel.addTarget(self, action:#selector(registerCall(_:)), for:.touchUpInside)
        
        let moreLabel = UIButton(frame: CGRect(x:UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 40, width: 60, height: 30))
        moreLabel.titleLabel?.textColor = UIColor.blue
        moreLabel.titleLabel?.font = UIFont(name: "Arial", size: 14)
        moreLabel.setTitle("更多...", for: UIControlState.normal)
        moreLabel.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(moreLabel)
        moreLabel.addTarget(self, action:#selector(moreCall(_:)), for:.touchUpInside)
        
        
    }
    
    // 登录服务器
    @objc func registerCall(_ sender: UIButton){
        let setpwd = RegistereView()
        self.show(setpwd, sender: nil)
    }
    
    // 登录服务器
    @objc func moreCall(_ sender: UIButton){
        let alert = UIAlertController(title: "", message: "请选择操作", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel){
            (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        
        let okAction = UIAlertAction(title: "注册账号", style: UIAlertActionStyle.default){
            (result : UIAlertAction) -> Void in
            // 注册账号
            let backButton = UIBarButtonItem()
            backButton.title = "注册账号"
            self.navigationItem.backBarButtonItem = backButton
//            let registView = RegisterViewTable()
//            self.show(registView, sender: nil)
            
        }
        
        let forgetAction = UIAlertAction(title: "忘记密码", style: UIAlertActionStyle.default){
            (result : UIAlertAction) -> Void in
            let backButton = UIBarButtonItem()
            backButton.title = "登陆"
            self.navigationItem.backBarButtonItem = backButton
//            let name = FindPasswordTable()
//            self.show(name, sender: nil)
            print("OK")
        }
        
        
        // 验证码登录
        let codeAction = UIAlertAction(title: "短信登录", style: UIAlertActionStyle.default){
            
            (result : UIAlertAction) -> Void in
            let backButton = UIBarButtonItem()
            backButton.title = "短信登录"
            self.navigationItem.backBarButtonItem = backButton
//            let name = CodeViewTable()
//            self.show(name, sender: nil)
            print("OK")
        }
        
        alert.addAction(cancelAction)
//        alert.view.backgroundColor = UIColor(displayP3Red: 70, green: 122, blue: 159, alpha: 125)
        
        alert.addAction(forgetAction)
        alert.addAction(okAction)
        alert.addAction(codeAction)
        self.present(alert, animated: true)
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
