 //
//  HomeViewController.swift
//  JYVVVeibo
//
//  Created by atom on 16/9/13.
//  Copyright © 2016年 atom. All rights reserved.
//

import UIKit
 
import Alamofire
 
 private let homeCellID = "homecell"

class HomeViewController: JYBaseViewController {
    
    fileprivate lazy var listViewModel = JYStatuesList()
    
    var pullrefreshflag = false
    
    var refreshControl: UIRefreshControl?
    
    var statues: [Status]? {
        
        didSet{
            
            homeTableView.reloadData()
        
        }
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUI()
        
        loadData()
        
        
    }
    
    
    
    //overrider func setUI() {}
    
    fileprivate lazy var homeTableView: UITableView = {
        
        let tableview = UITableView()
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: JYCellID.homeCellID)
        
        tableview.dataSource = self
        
        tableview.delegate = self
        
        tableview.frame = UIScreen.main.bounds
        
        return tableview
        
    }()

}
 
 extension HomeViewController {
    
    override func setUI() {
        
        super.setUI()
        
        setNavBarButton()
        
        setTableView()
    
    }
    
    func setTableView() {
        
        //view.addSubview(homeTableView)
        
        view.insertSubview(homeTableView, belowSubview: navBar)
        
        automaticallyAdjustsScrollViewInsets = true
        
        refreshControl = UIRefreshControl()
        
        homeTableView.refreshControl = refreshControl
        
        homeTableView.contentInset = UIEdgeInsetsMake(39, 0, 0, 0)
        
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    
    }
    
    func setNavBarButton() {
        
        let btn = UIButton.jyTextButton("好友", fontSize: 16, color: .red, heightColor: .orange)
        
        btn.addTarget(self, action: #selector(showFirends), for: .touchUpInside)
        
        navItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
    
    }
    
    @objc fileprivate func showFirends() {
        
        let vc = JYDemoViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @objc fileprivate func loadData() {
        
        listViewModel.loadstatues(pullup: pullrefreshflag) { (success) in
            
            if success {
                
                self.refreshControl?.endRefreshing()
                
                //self.pullrefreshflag = false
                
                self.homeTableView.reloadData()
            
            } else {}
            
        }
        
        /*WeiboNetWork.getWeiboData(sinceID: sinceID, maxID: maxID, url: JYAPIHelper.homeTimeline) { (statues, error) in
            
            if statues != nil && error == nil {
                
                self.refreshControl?.endRefreshing()
                
                if sinceID > 0 {
                    
                    self.statues = statues! + self.statues!
                    
                } else if maxID > 0 {
                    
                    self.statues = self.statues! + statues!
                    
                    self.pullrefreshflag = false
                    
                } else {
                    
                    self.statues = statues
                    
                }
                
                
            } else {
                
                
                self.refreshControl?.endRefreshing()
                
            }
        }*/
    
    }
 
 }
 
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.statues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: JYCellID.homeCellID, for: indexPath)
        
        cell.textLabel?.text = listViewModel.statues[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let row = indexPath.row
        
        let section = tableView.numberOfSections - 1
        
        if row < 0 || section < 0 {
            
            return
        
        }
        
        let count = tableView.numberOfRows(inSection: section)
        
        if row == (count - 1) && !pullrefreshflag {
            
            //pullrefreshflag = true
            
            print("pullrefreshflag")
            
            //loadData()
        
        }
        
    }
 
 }
