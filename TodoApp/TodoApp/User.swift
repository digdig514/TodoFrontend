//
//  User.swift
//  TodoApp
//
//  Created by Diego Souza Sampaio on 17-06-22.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import Foundation


import UIKit

class UserList: NSObject {
    var list:[User] = [User]()
    
    func add(user:User) -> Void {
        list.append(user)
    }
    
    func count() -> Int {
        return list.count
    }
    

    

    
    

    
}
