//
//  CreateCustomerViewModel.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/28/23.
//

import Foundation
import UIKit

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

final class CreateCustomerViewModel: ObservableObject {
    @Published var newCustomer: NewCustomer = .empty
    @Published var custumerList = [CustomersMeasurementsAndDetails]()
    
    var isValid: Bool {
        !newCustomer.clientInfo.firstName.isEmpty &&
        !newCustomer.clientInfo.lastName.isEmpty &&
        !newCustomer.clientInfo.phone.isEmpty &&
        !newCustomer.clientInfo.comments.isEmpty
    }
    
    func getData() {
        //get a reference to the database
        let db = Firestore.firestore()
        
//        //read the documents at a specific path
//        db.collection("Customers").getDocuments { snapshot, error in
//            //cehck for errors
//            if error == nil {
//                //no errors
//                if let snapshot = snapshot {
//                    //update the list in themain thread
//                    DispatchQueue.main.async {
//                        //get documents and create customer list
//                        self.custumerList = snapshot.documents.map { d in
//                            
//                            //create a customer item for each doc return
//                            return CustomersMeasurementsAndDetails(id: d.documentID,
//                                             name: d["firstName"] as? String ?? "",
//                                             lastName: d["lasName"] as? String ?? "",
//                                             phone: d["Phone"] as? String ?? "",
//                                             comments: d["comments"] as? String ?? "")
//                        }
//                    }
//                }
//            } else {
//                //handle the error
//            }
//        }
    }
    
    func clearAll() {
        self.newCustomer = .empty
//        let alert = UIAlertController(title: "Alert", message: "Are you sure you want to delete everything in the form?", preferredStyle: .alert)
//        self.present(alert,animated: true)
//        let okAction = UIAlertAction(title: "OK", style: .default) {
//            (action: UIAlertAction!) in
//            self.dismiss(animated: true)
//        }
//        alert.addAction(okAction)
        
    }
    
    func createCustomer(withName firstName: Binding<String>, lastName: Binding<String>, phone: Binding<String>, comments: Binding<String>) {
//        guard let uid = result?.user.uid else {return}
        let values = ["firstName":newCustomer.clientInfo.firstName,"lasName": newCustomer.clientInfo.lastName,"Phone":newCustomer.clientInfo.phone,"comments":newCustomer.clientInfo.comments]
        
        let db = Firestore.firestore()
        
        db.collection("Customers").document(newCustomer.clientInfo.phone).setData(values) { (error) in
            if error != nil {
                
                SignUpVC().popSimpleAlert("Alert", messeage: "failed to saved the values \(String(describing: error?.localizedDescription))")
            }
        }
        //go back to Dashboard vc
       
    }
}
