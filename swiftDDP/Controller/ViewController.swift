//
//  ViewController.swift
//  swiftDDP
//
//  Created by Zyad Galal on 6/18/19.
//  Copyright © 2019 Zyad Galal. All rights reserved.
//

import UIKit
import ObjectiveDDP

class ViewController: UIViewController  {
    
    @IBOutlet weak var tableView: UITableView!
    var lists = M13MutableOrderedDictionary<NSCopying, AnyObject>()
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewWillAppear(_ animated: Bool) {
        AppDelegate.meteor?.addSubscription("posts.all")
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getAllPosts), name: NSNotification.Name(rawValue: "posts_added"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getAllPosts), name: NSNotification.Name(rawValue: "posts_updated"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getAllPosts), name: NSNotification.Name(rawValue: "posts_removed"), object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        AppDelegate.meteor?.removeSubscription("posts.all")
        lists.removeAllObjects()
    }
    @objc func getAllPosts ()
    {
        self.lists = AppDelegate.meteor?.collections["posts"] as! M13MutableOrderedDictionary
        print(lists)
        tableView.reloadData()
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(self.lists.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        let currentIndex = self.lists.object(at: UInt(indexPath.row))
        cell.textLabel?.text = currentIndex["content"] as? String
        cell.detailTextLabel?.text = currentIndex["title"] as? String
        return cell
    }	
}
