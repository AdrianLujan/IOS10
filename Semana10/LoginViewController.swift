//
//  LoginViewController.swift
//  Semana10
//
//  Created by mbtec22 on 20/05/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var userOrEmailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        // Do any additional setup after loading the view.
    }
    
    func setUpStyle(){
        loginButton.layer.cornerRadius = 6.0
        userOrEmailTextField.text = "adrian@gmail.com"
        passwordTextField.text = "adrian111"
    }
    

    @IBAction func onClickBackBtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
        let user = userOrEmailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: user, password: password) { (responseUser, error) in
            if error == nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                let alert = UIAlertController(title: "Error", message: "User or Password Incorrect", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(alertAction)
                self.present(alert, animated: true, completion: nil)
                print("Todo Mal")
            }
        }
    }
    
}
