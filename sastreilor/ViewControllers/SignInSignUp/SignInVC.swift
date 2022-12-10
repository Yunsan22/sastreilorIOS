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
        setup()
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
    
    private func setup(){
        setupDismissKeyboardGesture()
        setupKeyboardHiding()
    }
    
    func setupDismissKeyboardGesture(){
        //this code will dismiss the keyboard
        let dismisskeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(dismisskeyboardTap)

    }
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer){
        if recognizer.state == UIGestureRecognizer.State.ended{
            view.endEditing(true)
        }
    }
    
    func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(signinkeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(signinkeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

}
extension SignInVC {
    @objc func signinkeyboardWillShow(sender: NSNotification) {

        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextfield = UIResponder.currentFirst() as? UITextField else {
            return
        }
        
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextfield.frame, from: currentTextfield.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height

        print("print value for tefield: \(textFieldBottomY)")
        print("print value for keyboardtopy: \(keyboardTopY)")
        if textFieldBottomY > 530.0 {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newframey = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newframey
        }

    }
    @objc func signinkeyboardWillHide(sender: NSNotification){
        view.frame.origin.y = 0
    }
}
