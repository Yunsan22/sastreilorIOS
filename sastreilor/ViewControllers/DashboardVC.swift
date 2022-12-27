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
    
    var values = [String]()
    
    fileprivate func loadDAta(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
        let refTouserTable = db.collection("Users")
        
        let userRefe = db.collection("Users").document(uid)

        userRefe.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                self.values = [dataDescription] as! [String]
                print("this is values \(self.values)")
                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        loadDAta()

        // Do any additional setup after loading the view.
    }
    
    @objc func handleLogout(){
        let FirebaseAuth = Auth.auth()
        //creating alert to confirm log out
        let alert = UIAlertController(title: NSLocalizedString("Alert", comment: "Alertas"), message: NSLocalizedString("Are you sure you want to log out?", comment: "no comments now") , preferredStyle: .alert)
        
        present(alert,animated: true)
        //creating logout confirmation
        let confimAction = UIAlertAction(title:NSLocalizedString("Confirm", comment: "comentarios"), style: .default) {
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

extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    number os sections
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let datavalue = values[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell") as? DashboardCell else { return UITableViewCell()
            
        }
        
//        cell.nameLabel.text = [datavalue["firstName"]] as?  String
        return cell
    }
    
    
}
