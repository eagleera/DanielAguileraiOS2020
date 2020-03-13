//
//  WebServiceViewController.swift
//  iOS2020
//
//  Created by Noel Aguilera Terrazas on 12/03/20.
//  Copyright © 2020 Daniel Aguilera. All rights reserved.
//

import UIKit
import Alamofire

class WebServiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var refreshControl: UIRefreshControl!
    var restaElements: [RestaurantElement] = []
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaElements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaCell", for: indexPath) as? RestaurantTableViewCell
        cell!.restaElement = restaElements[indexPath.row]
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor(named: "Primary")
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    override func viewWillAppear(_ animated: Bool) {
        AF.request("http://www.mocky.io/v2/5e61af6930000095004d54ed")
            .validate()
            .responseDecodable(of: [RestaurantElement].self) { (response) in
                guard let restaElements = response.value else {
                    return
                }
                DispatchQueue.main.async {
                    self.restaElements = restaElements
                    self.tableView.reloadData()
                }
        }
    }
    
    @objc func didPullToRefresh() {
        viewWillAppear(true)
        refreshControl.endRefreshing()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
