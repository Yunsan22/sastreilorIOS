//
//  DashboardVC.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/9/22.
//

import UIKit
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth



class DashboardVC: UIViewController {
    
    let collectionViewHeight = 170
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Double(collectionViewHeight) * 0.45, height: Double(collectionViewHeight) * 0.9)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()

    
    var values = [String]()
    
    var testArray = Colors()
    
    fileprivate func loadDAta(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let db = Firestore.firestore()
        let refTouserTable = db.collection("Users")
        
        let userRefe = db.collection("Users").document(uid)

        userRefe.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                self.values = [dataDescription] as! [String]
//                print("this is values \(self.values)")
//                print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark
        // Do any additional setup after loading the view.
        addSwiftUIView()
        
        
//        CreateCollectionview()
//        createStackView()
    }
    
    
    func addSwiftUIView() {
        let swiftUIView = DashboardContentView()
        addSubSwiftUIView(swiftUIView, to: view)
    }
    
    func CreateCollectionview(){
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: CGFloat(collectionViewHeight)).isActive = true
        collectionView.register(DasboardCollectionCell.self, forCellWithReuseIdentifier: "DashboardCollectionCell")
        collectionView.dataSource = self
    }
    
    @objc func measurementBtnTapped(){
////        let vc = UIHostingController(rootView: MeasurementContentView{_ in })
//        let vc = UIHostingController(rootView: CustomerDetailsContentView())
////        let vc = UIHostingController(rootView: theView())
//
//
//        presentInFullScreen(vc, animated: true)
//
////        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func createJobBtnTapped(){
//        let vc = UIHostingController(rootView: CustomersListContentView())
//        
////        presentInFullScreen(vc, animated: true)
//        
//        navigationController?.pushViewController(vc, animated: true)
        print("done 123")
       
    }
    @objc func jobDeliveredBtnTapped(){
        print("delivered 123")
       
    }
    
    func createStackView(){
        
        let measuresViewModel = myCustomButtnViewmodel(title: NSLocalizedString("TAKE", comment: "na"),subTittle: NSLocalizedString("MEASUREMENTS", comment: "na"), imagename: "measurement" )
        let taskJobViewModel = myCustomButtnViewmodel(title: NSLocalizedString("ADD", comment: "na"), subTittle: NSLocalizedString("JOB", comment: "na"), imagename: "imagAdd-")
        let deliveredJobViewModel = myCustomButtnViewmodel(title: NSLocalizedString("JOB", comment: "na"), subTittle: NSLocalizedString("DELIVERED", comment: "na"), imagename: "Rectangle 18")
        
        let measurmentButton: MycustomButton = {
            let buton = MycustomButton()
            return buton
        }()
        measurmentButton.configure(with: measuresViewModel)
        measurmentButton.addTarget(self, action: #selector(self.measurementBtnTapped), for: .touchUpInside)
        
        let CreateJobBtn: MycustomButton = {
            let buton = MycustomButton()
            return buton
        }()
        CreateJobBtn.configure(with: taskJobViewModel)
        CreateJobBtn.addTarget(self, action: #selector(self.createJobBtnTapped), for: .touchUpInside)
        
        
        let JobsDeliveredBtn: MycustomButton = {
            let buton = MycustomButton()
            return buton
        }()
        JobsDeliveredBtn.configure(with: deliveredJobViewModel)
        JobsDeliveredBtn.addTarget(self, action: #selector(self.jobDeliveredBtnTapped), for: .touchUpInside)
        
        
        [measurmentButton, CreateJobBtn, JobsDeliveredBtn].forEach {
//            $0.backgroundColor = .systemBlue
            $0.setBackgroundImage(UIImage(named: "Rectangle 34"), for: .normal)
        }
       
        let stackView = UIStackView(arrangedSubviews: [measurmentButton, CreateJobBtn, JobsDeliveredBtn])
        stackView.distribution = .fillEqually
        stackView.spacing = 25
        stackView.axis = .vertical

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
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
extension DashboardVC {
    func presentInFullScreen(_ viewController: UIViewController,
                               animated: Bool,
                               completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: animated, completion: completion)
      }
}

extension DashboardVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionCell", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .orange : .green
        
        
        return cell
    }
}

//extension DashboardVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return testArray.objectsArray[section].subcategory.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView()
//               headerView.backgroundColor = UIColor.green
//               let titleLabel = UILabel(frame: CGRect(x: 8, y: 0, width: 200, height: 44))
//               headerView.addSubview(titleLabel)
//               titleLabel.textColor = UIColor.white
//               titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//               titleLabel.text = testArray.objectsArray[section].category
//               return headerView
//    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44
//    }
//
////    number os sections
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 1
////    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let datavalue = values[indexPath.row]
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardCell") as? DashboardCell else { return UITableViewCell()
//
//        }
//
//
//        return cell
//    }
//
//
//}
extension DashboardVC {

    /// Add a SwiftUI `View` as a child of the input `UIView`.
    /// - Parameters:
    ///   - swiftUIView: The SwiftUI `View` to add as a child.
    ///   - view: The `UIView` instance to which the view should be added.
    func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content : View {
        let hostingController = UIHostingController(rootView: swiftUIView)

        /// Add as a child of the current view controller.
        addChild(hostingController)

        /// Add the SwiftUI view to the view controller view hierarchy.
        view.addSubview(hostingController.view)

        /// Setup the contraints to update the SwiftUI view boundaries.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

        /// Notify the hosting controller that it has been moved to the current view controller.
        hostingController.didMove(toParent: self)
    }
}

