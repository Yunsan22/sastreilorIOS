//
//  DashboardVC.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/9/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class DashboardVC: UIViewController {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func handleLogout(){
        let FirebaseAuth = Auth.auth()
        //creating alert to confirm log out
        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to log out?", preferredStyle: .alert)
        
        present(alert,animated: true)
        //creating logout confirmation
        let confimAction = UIAlertAction(title: "Confirm", style: .default) {
            (action: UIAlertAction!) in
            do {
                try FirebaseAuth.signOut()
                let main = UIStoryboard(name: "Main", bundle: nil)
                let signInVC = main.instantiateViewController(withIdentifier: "SignInVC")
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
                delegate.window?.rootViewController = signInVC
            } catch let signOutError as NSError {
                let alert = UIAlertController(title: "Alert", message: signOutError as? String, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert,animated: true)
            }
        }
        //creating action to cancel and stay logged in
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        //adding both action to alert pop up
        alert.addAction(confimAction)
        alert.addAction(cancelAction)
        }
        
    

    @IBAction func onLogoutBtn(_ sender: Any) {
        handleLogout()
    }
    

}
