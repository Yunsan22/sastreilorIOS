//
//  SignInVC.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/4/22.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet weak var GoogleBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
    }
    
  
    @IBAction func OnGoogleSignInBtn(_ sender: Any) {
        
        signInWithGoogle()
    }
    
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            
            return "All fields are required to Sign In".localized()
            
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
           handleSignIn()
        }
        
        
    }

   
    @objc func signInWithGoogle(){
        
//        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
              let alert = UIAlertController(title: "error with gogle sigin".localized(), message: error.localizedDescription, preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default))
              self.present(alert,animated: true)
              print("this is an problem")
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

          // ...
            Auth.auth().signIn(with: credential) { authResult, error in
                if error != nil {
                    print("this is no good")
//                  let authError = error as NSError
//                  if isMFAEnabled,
//                        authError.code == AuthErrorCode.secondFactorRequired.rawValue {
//                    // The user is a multi-factor user. Second factor challenge is required.
//                    let resolver = authError
//                      .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
//                    var displayNameString = ""
//                    for tmpFactorInfo in resolver.hints {
//                      displayNameString += tmpFactorInfo.displayName ?? ""
//                      displayNameString += " "
//                    }
//                    self.showTextInputPrompt(
//                      withMessage: "Select factor to sign in\n\(displayNameString)",
//                      completionBlock: { userPressedOK, displayName in
//                        var selectedHint: PhoneMultiFactorInfo?
//                        for tmpFactorInfo in resolver.hints {
//                          if displayName == tmpFactorInfo.displayName {
//                            selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
//                          }
//                        }
//                        PhoneAuthProvider.provider()
//                          .verifyPhoneNumber(with: selectedHint!, uiDelegate: nil,
//                                             multiFactorSession: resolver
//                                               .session) { verificationID, error in
//                            if error != nil {
//                              print(
//                                "Multi factor start sign in failed. Error: \(error.debugDescription)"
//                              )
//                            } else {
//                              self.showTextInputPrompt(
//                                withMessage: "Verification code for \(selectedHint?.displayName ?? "")",
//                                completionBlock: { userPressedOK, verificationCode in
//                                  let credential: PhoneAuthCredential? = PhoneAuthProvider.provider()
//                                    .credential(withVerificationID: verificationID!,
//                                                verificationCode: verificationCode!)
//                                  let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator
//                                    .assertion(with: credential!)
//                                  resolver.resolveSignIn(with: assertion!) { authResult, error in
//                                    if error != nil {
//                                      print(
//                                        "Multi factor finanlize sign in failed. Error: \(error.debugDescription)"
//                                      )
//                                    } else {
//                                      self.navigationController?.popViewController(animated: true)
//                                    }
//                                  }
//                                }
//                              )
//                            }
//                          }
//                      }
//                    )
//                  } else {
//                    self.showMessagePrompt(error.localizedDescription)
//                    return
//                  }
                  // ...
//                  return
                }
                // User is signed in
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("whoooooo")
                // ...
            }
        }
    }
    
    
    @objc func handleSignIn(){
        
        //create clean version of the data
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Sign in the user
        Auth.auth().signIn(withEmail: email, password: password) { //[weak self] authResult, error in
            (authResult, error) in
            //              guard let strongSelf = self else { return }
            
            if error != nil {
                //couldnt sign in
                let alert = UIAlertController(title: "Alert", message: error?.localizedDescription.localized(), preferredStyle: .alert)
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

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
