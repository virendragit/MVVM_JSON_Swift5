//
//  ViewController.swift
//  MVVM+Json
//
//  Created by Virendra Gupta on 4/10/20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var viewModelUser = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getAllUserData()
        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
    }


}

extension ViewController: UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        
        let modelUser = viewModelUser.arrUsers[indexPath.row]
        
        if let id = modelUser.id {
            cell?.lblId.text = "\(id)"
        }else{
            cell?.lblId.text = "No ID"
            
        }
        cell?.lblFirst.text = modelUser.title
        return cell!
        
    }
}

