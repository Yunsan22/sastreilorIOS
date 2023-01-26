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

class MycustomButton: UIButton {
    
    private let myTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let myIconView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    private var viewModel: myCustomButtnViewmodel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel: myCustomButtnViewmodel){
        self.viewModel = viewModel
        super.init(frame: .zero)
              
        
        addSubviews()
        configure(with: viewModel)
    }
    private func addSubviews(){
        guard !myTitleLabel.isDescendant(of: self) else {
            return
        }
        addSubview(myTitleLabel)
        addSubview(myIconView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: myCustomButtnViewmodel){
        
        layer.masksToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1.5
        
        addSubviews()
        
        myTitleLabel.text = viewModel.title
        myIconView.image = UIImage(systemName: viewModel.imagename)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myIconView.frame = CGRect(
            x: 5,
            y: 5,
            width: 50,
            height: frame.height
        ).integral
        
        myTitleLabel.frame = CGRect(
            x: 60,
            y: 5,
            width: frame.width - 65 ,
            height: (frame.height-10)/2
        ).integral
    }
    
}

struct myCustomButtnViewmodel {
    let title: String
    let imagename: String
}


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
        
       
        // Do any additional setup after loading the view.
        CreateCollectionview()
        createStackView()
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
        print("done 123")
    }
    
    func createStackView(){
        let imagestring = UIImage(named: "measurement")
        let viewModel = myCustomButtnViewmodel(title: "take measurements", imagename: "cart" )
        let buttun1: MycustomButton = {
            let buton = MycustomButton()
            return buton
        }()
        
        buttun1.configure(with: viewModel)
        let measurmentButton = customBtnView(image: UIImage(named: "measurement")!, title: "take measurments")
        measurmentButton.addTarget(self, action: #selector(self.measurementBtnTapped), for: .touchUpInside)
        let button2 = UIButton(type: .system)
        button2.setTitle("B 2", for: .normal)
        
        let button3 = UIButton(type: .system)
        button3.setTitle("B 3", for: .normal)
        
        let button4 = UIButton(type: .system)
        button4.setTitle("B 4", for: .normal)
        
        [buttun1,measurmentButton, button2, button3, button4].forEach {
            $0.backgroundColor = .systemBlue
        }
       
        let stackView = UIStackView(arrangedSubviews: [buttun1,measurmentButton, button2, button3, button4])
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .vertical

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    class customBtnView: UIButton {
        let imageBtnView = UIImageView()
        let colectiontitleLabel = UILabel()
        init(image: UIImage, title: String){
            imageBtnView.image = image
            colectiontitleLabel.text = title
            super.init(frame: .zero)
        }
        required init?(coder: NSCoder){
            fatalError("init(coder:) has not been implemented")
        }
        
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

extension DashboardVC: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionCell", for: indexPath)
        cell.backgroundColor = indexPath.row % 2 == 0 ? .black : .green
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
