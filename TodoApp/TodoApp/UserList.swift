//
//  UserList.swift
//  TodoApp
//
//  Created by Diego Souza Sampaio on 17-06-22.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var identity:[String] = ["",""]
    
    func firstName() -> String {
        return identity[0]
    }
    
    func setFirstName(firstName:String) -> Void {
        identity[0] = firstName
    }
    
    func password() -> String {
        return identity[1]
    }
    
    
    func setPassword(passowrd:String) -> Void {
        identity[1] = passowrd
    }
    
   
}

