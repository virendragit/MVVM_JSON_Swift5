//
//  UserViewModel.swift
//  MVVM+Json
//
//  Created by Virendra Gupta on 4/10/20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

class UserViewModel{
    
    weak var vc: ViewController?
    
    var arrUsers = [userModel]()
    
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, err)
            in
            if err == nil {
                
                if let data = data{
                
                do{
                    let userResponse = try JSONDecoder().decode([userModel].self, from: data)
                    
                    self.arrUsers.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                    
                    
                }catch let err{
                    print(err.localizedDescription)
                }
                
            }
            }
            else{
                print(err?.localizedDescription as Any)
            }
            
        }.resume()
    }
}

