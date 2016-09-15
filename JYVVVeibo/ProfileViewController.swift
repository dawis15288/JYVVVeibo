//
//  ProfileViewController.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/13.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit

class ProfileViewController: JYBaseViewController {
        
        fileprivate let WB_Client_ID = "1227520346"
        
        fileprivate let WB_REDIRECT_URI = ""
        
        fileprivate let WB_REDIRECT_URL = ""
        
        let weiboKey = "1227520346"
        
        let weiboSecret = "097fecf20a2cca6495bd35d2d0c2d7dd"
        
        //https://api.weibo.com/oauth2/authorize
        
        let authorizationEndPoint = "https://open.weibo.cn/oauth2/authorize"
        
        let accessTokenEndPoint = "https://api.weibo.com/oauth2/access_token"
        
        lazy var webView: UIWebView = {
            
            let wv = UIWebView()
            
            wv.delegate = self
            
            return wv
            
        }()
        
        
        
        override func loadView() {
            
            view = webView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            navigationItem.title = "oauth"
            
            //loadOAuthPage()
            
            startAuthorization()
        }
        
        fileprivate func startAuthorization() {
            
            let responseType = "code"
            
            let redirectURL = "https://api.weibo.com/auth2/default.html"
            
            let state = "authorize"
            
            let display = "mobile"
            
            let authorizationURL1 = "\(authorizationEndPoint)?client_id=\(weiboKey)&redirect_uri=\(redirectURL)&response_type=\(responseType)&display=\(display)&state=\(state)"
            
            print(authorizationURL1)
            
            //let request = NSURLRequest(URL: NSURL(string: authorizationURL1)!)
            
            let request = URLRequest(url: URL(string: authorizationURL1)!)
            
            webView.loadRequest(request)
            
            
            
        }
        
        fileprivate func loadOAuthPage() {
            
            let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_Client_ID)&redirect_uri=\(WB_REDIRECT_URI)"
            
            let url = URL(string: urlString)
            
            let resquest = URLRequest(url: url!)
            
            webView.loadRequest(resquest)
        }
    
    }
    
    extension ProfileViewController: UIWebViewDelegate {
        
        func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
            
            let url = request.url!
            
            if url.host == "api.weibo.com" {
                
                if url.absoluteString.range(of: "code") != nil {
                    
                    let urlParts = url.absoluteString.components(separatedBy: "?")
                    
                    let code = urlParts[1].components(separatedBy: "=")[2]
                    
                    requestForAccessToken(code)
                    
                
                }
                
            }
            
            return true
        }
        
        func requestForAccessToken(_ authorizationCode: String) {
            
            let grantType = "authorization_code"
            
            let redirectURL = "https://api.weibo.com/auth2/default.html"
            
            let postParms = "\(accessTokenEndPoint)?client_id=\(weiboKey)&client_secret=\(weiboSecret)&grant_type=\(grantType)&redirect_uri=\(redirectURL)&code=\(authorizationCode)"
            
            let bodyStr = "type=focus-c"
             
             let postData = bodyStr.data(using: String.Encoding.utf8)
             
             let postRequest = NSMutableURLRequest(url: URL(string: postParms)!)
             
             postRequest.httpMethod = "POST"
            
             postRequest.httpBody = postData
             
             //postRequest.addValue("aplication/x-www-form-urlencoded;", forHTTPHeaderField: "Content-Type")
             
             let session = URLSession(configuration: URLSessionConfiguration.default)
             
             let task: URLSessionDataTask = session.dataTask(with: postRequest as URLRequest) { (data, response, error) -> Void in
             
             let statueCode = (response as! HTTPURLResponse).statusCode
             
             print("statueCode = \(statueCode)")
             
             if statueCode == 200 {
             
             do {
             
             let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
             
             
             print(dataDictionary)
             
             
             
             } catch {
             
             print("error \(error)")
             
             }
             
             
             }
             
             }
             
             task.resume()
            
        }
        
    }



