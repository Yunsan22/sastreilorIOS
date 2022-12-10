//
//  SignInVC.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/4/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            
            return "All fields are required to Sign In"
            
        }
        
        return nil
    }
    

    @IBAction func onSignIn(_ sender: Any) {
        print("btn clicked")
        
        //validate text field
        let error = validateFields()
        if error != nil {
            //there is something wrong with fields, show error
            showError(error!)
        } else {
            
            //create clean version of the data
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Sign in the user
            Auth.auth().signIn(withEmail: email, password: password) { //[weak self] authResult, error in
                (authResult, error) in
                //              guard let strongSelf = self else { return }
                
                if error != nil {
                    //couldnt sign in
                    let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert,animated: true)
//                    self.showError(error!.localizedDescription)
                }
                else {
                    //go into gome
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
              
            }
        }
        
        
    }
    
    func showError(_ message:String){
        let alert = UIAlertController(title: "Alert", message: validateFields(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
        
    }
    
    

}
