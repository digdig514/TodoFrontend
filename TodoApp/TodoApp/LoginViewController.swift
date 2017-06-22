//
//  LoginViewController.swift
//  TodoApp
//
//  Created by Karl J. Villeneuve on 2017-06-16.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var user:User = User()
    var list:UserList! = nil
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    
    @IBOutlet weak var errorMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    //
    
    @IBAction func btnLogin(_ sender: UIButton) {
        // LoginManager
        LoginManager.logIn(userName: txtFieldUserName.text!, password: txtFieldPassword.text!) {
            (responseData, error) in
            if let response = responseData {
                if response.success == true {
                    print(response)
                    let todosViewController = self.storyboard?.instantiateViewController(withIdentifier: "TodosTableViewController")
                    self.navigationController?.pushViewController(todosViewController!, animated: true)
                } else {
                    print("User name and password were not correct")
                    let alert = UIAlertController(title: "Error", message: "User name and password were not correct", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            } else if  error == true {
                print("Backend error")
                let alert = UIAlertController(title: "Error", message: "Something went wrong with the backend", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  func register(username: String, password: String)
  {
    txtFieldUserName.text = username
    txtFieldPassword.text = password
    
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createuser" {
            let vc = segue.destination as! RegistrationViewController
            vc.user = self.user
            vc.list = self.list
        }
    }
    
    
    //    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //        if identifier == "loggedIn" {
    //            if txtFieldUserName.text == "user" && txtFieldPassword.text == "pass" {
    //                return true
    //            } else {
    //                return false
    //            }
    //        }
    //        return false
    //
    //    }
    
    
}
