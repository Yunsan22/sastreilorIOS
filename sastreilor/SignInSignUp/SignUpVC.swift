//
//  SignUpVC.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/4/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

      

class SignUpVC: UIViewController {
    
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var lastNameTextfield: UITextField!
    
    @IBOutlet weak var emailTextfield: UITextField!
        
    @IBOutlet weak var passwordTexfield: UITextField!
    
    @IBOutlet weak var confirmPwTextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        
    }
    //check and validate that the data is correct. if everything is correct, this method returns nill
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if nameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTexfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || confirmPwTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "All fields are required to Sign up"
            
        }
        //check if password is secure
        let cleanPW = passwordTexfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanconfirmPW = confirmPwTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanPW != cleanconfirmPW {
            
            return "Passwords do not Match"
            
        }
        if Utilities.isPasswordValid(cleanPW) == false {
            //pw is not secure
            return "Please make sure your password is at least 8 charaters, contains special charaters and a number"
        }
        
        return nil
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        print("sign up btn clicked")
        //validate the fields
        
        let error = validateFields()
        if error != nil {
            //there is something wrong with fields, show error
            showError(error!)
        }else {
            //create user

             Auth.auth().createUser(withEmail: "email", password: "password") { result, err in
                if err != nil {
                    
                    //there was an error
//                    self.showError("Error Creating user")
                    self.showError(err!.localizedDescription)
                } else {
                    
                }
            }


            //go back to sign in vc
        }
     
        
    }
    
    func showError(_ message:String){
        let alert = UIAlertController(title: "Alert", message: validateFields(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert,animated: true)
        
    }
    

}
