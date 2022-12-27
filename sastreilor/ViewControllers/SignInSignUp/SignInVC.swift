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
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    

    @IBOutlet weak var GoogleBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
//        FBbtn.permissions = ["email","public_profile"]
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
    
//    @IBAction func onSignInWithFB(_ sender: Any) {
//        SiginWithFaceBook()
//    }
//    @objc func SiginWithFaceBook(){
//
//        if let token = AccessToken.current,
//                !token.isExpired {
//                // User is logged in, do work such as go to next view controller.
//        }else {
//            FBbtn.permissions = ["email","public_profile"]
//        }
//
//        let loginManager = LoginManager()
//                loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
//                    if let error = error {
//                        print("Failed to login: \(error.localizedDescription)")
//                        return
//                    }
//
//                    guard let accessToken = AccessToken.current else {
//                        print("Failed to get access token")
//                        return
//                    }
//
//                    let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
//
//                    // Perform login by calling Firebase APIs
//                    Auth.auth().signIn(with: credential, completion: { (user, error) in
//                        if let error = error {
//                            print("Login error: \(error.localizedDescription)")
//                            let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
//                            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                            alertController.addAction(okayAction)
//                            self.present(alertController, animated: true, completion: nil)
//                            return
//                        }else {
//
//                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
//                            print("whoooooo")
//                            //no needed
////                            self.currentUserName()
//                        }
//
//                    })
//
//                }
//    }
    
//    func currentUserName()  {
//            if let currentUser = Auth.auth().currentUser {
//                self.btn_sign_out.isHidden = false
//                lb_login_Status.text = "YOU ARE LOGIN AS - " +  (currentUser.displayName ?? "DISPLAY NAME NOT FOUND")
//            }
//        }
    

   
    @objc func signInWithGoogle(){
        
//        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
              self.popSimpleAlert("Error with Google sigin", messeage: error.localizedDescription)
              print(error.localizedDescription)
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
                    self.popSimpleAlert("Alert", messeage: error?.localizedDescription ?? "There was an error")
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
        
        //Sign in the user that has veried email
        Auth.auth().signIn(withEmail: email, password: password) { //[weak self] authResult, error in
            (authResult, error) in
            //              guard let strongSelf = self else { return }
            if error != nil {
                //couldnt sign in
                self.popSimpleAlert("Alert", messeage: error?.localizedDescription ?? "There was an error")
//                    self.showError(error!.localizedDescription)
            }
            else {
                //go into gome
                let user = authResult!.user
                if user.isEmailVerified {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                } else {
                    //email is not verified
                    self.popSimpleAlert("Alert", messeage: "Email is not verified")
                }
            }
        }
        
    }
    
    func showError(_ message:String){
        let alert = UIAlertController(title: NSLocalizedString("Alert", comment: "comments"), message: NSLocalizedString(validateFields() ?? "nothing found", comment: "comments") , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: "comments"), style: .default))
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
    
    func popSimpleAlert(_ title: String, messeage: String){
        
        let alert = UIAlertController(title: NSLocalizedString(title, comment: "comments"), message: NSLocalizedString(messeage,comment: "nothiing"), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "comment"), style: .default))
        present(alert,animated: true)
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
extension SignInVC: LoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
//        let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "email","name"], tokenString: token, version: nil, httpMethod: .get)
//
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
        return
    }
    
    
}
