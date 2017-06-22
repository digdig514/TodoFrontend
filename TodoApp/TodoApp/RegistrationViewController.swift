//
//  RegistrationViewController.swift
//  TodoApp
//
//  Created by Diego Souza Sampaio on 17-06-22.
//  Copyright © 2017 Fatih Nayebi. All rights reserved.
//

import UIKit

protocol registration {
    func register(username: String, password: String)
}

var delegate : registration?
class RegistrationViewController: UIViewController {
    var user:User = User()
    var list:UserList! = nil
    @IBOutlet weak var newUser: UITextField!
    @IBOutlet weak var newPassowrd: UITextField!
    @IBAction func onClick(_ sender: Any) {
            //performSegue(withIdentifier: "homePage", sender: self)
    
        RegisterManager.register(userName:  newUser.text!, password: newPassowrd.text!) { (responseData, error) in
        if let response = responseData {
            if response.success == true {
                print(response)
                print("Sucess")
            } else {
                print("Error")
                let alert = UIAlertController(title: "Error", message: "Error", preferredStyle: .alert)
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
   /*@IBAction func createAccount(_ sender: Any) {
     
        delegate?.register(username: user, password: pass)
        self.dismiss(animated: true, completion: nil)
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "homePage" {
            if newUser.text! == newPassowrd.text! {
                user = User()
                user.setFirstName(firstName: newUser.text!)
                user.setPassword(passowrd: newUser.text!)
    
                    list.add(user: user)
                
                
                return true
               
            }
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homePage" {
            let vc = segue.destination as! LoginViewController
            vc.user = self.user
           
        }

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
