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
        setup()
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
    
    @IBAction func backToSignInBtn(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @objc func handleSignUp() {
        guard let email = emailTextfield.text else {return}
        guard let name = nameTextfield.text else {return}
        guard let lastName = lastNameTextfield.text else {return}
        guard let password = passwordTexfield.text else {return}
        
        createUser(withEmail: email, password: password, name: name, lastname: lastName)
    }

    @IBAction func onSignUp(_ sender: Any) {
        //validate the fields
        let error = validateFields()
        if error != nil {
            //there is something wrong with fields, show error
            showError(error!)
        }else {
            handleSignUp()
        }
    }
    
    
    func createUser(withEmail email: String, password: String, name: String, lastname: String) {
        //create clean version of the data
        let firstName = nameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastName = lastNameTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTexfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
            if let error = error {
                //there was an error
//                    self.showError("Error Creating user")
                let alert = UIAlertController(title: "Alert", message: "Failed to sign user up with error \(error.localizedDescription )", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert,animated: true)
                return
            }
            guard let uid = result?.user.uid else {return}
            let values = ["firstName":firstName,"lasName": lastName,"email":email,"uid": uid]
            let db = Firestore.firestore()
            
            db.collection("Users").document(uid).setData(values) { (error) in
                if error != nil {
                    let alert = UIAlertController(title: "Alert", message: "failed to saved the values \(error?.localizedDescription)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert,animated: true)
                }
            }
            //go back to sign in vc
            let alert = UIAlertController(title: "Alert", message: "you have registered", preferredStyle: .alert)
            self.present(alert,animated: true)
            let okAction = UIAlertAction(title: "OK", style: .default) {
                (action: UIAlertAction!) in
                self.dismiss(animated: true)
            }
            alert.addAction(okAction)
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

}
extension SignUpVC {
    @objc func keyboardWillShow(sender: NSNotification) {

        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextfield = UIResponder.currentFirst() as? UITextField else {
            return
        }
//        print("foo - userInfo: \(userInfo)")
//                print("foo - keyboardFrame: \(keyboardFrame)")
//                print("foo - currentTextField: \(currentTextfield)")

        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextfield.frame, from: currentTextfield.superview)
        
      
        let confirmPWTextFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        print("print value for tefield: \(confirmPWTextFieldBottomY)")
        print("print value for keyboardtopy: \(keyboardTopY)")
        
        if confirmPWTextFieldBottomY > 520.0 {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
            print("this happened")
        }


    }
    @objc func keyboardWillHide(sender: NSNotification){
        view.frame.origin.y = 0
    }
}
