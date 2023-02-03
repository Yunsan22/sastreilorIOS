//
//  CustDetailsAndMeasuresService.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/29/23.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

enum customerKeys: String {
    
    case firstName
    case lasName
    case phone
    case gender
    case comments
}

protocol CustDetailsAndMeasuresService {
    func createCustomers(with detailsAndMeasures: CustomersMeasurementsAndDetails) -> AnyPublisher<Void, Error>
}

final class CustDetailsAndMeasuresServiceImpl: CustDetailsAndMeasuresService {
    
    
    func createCustomers(with detailsAndMeasures: CustomersMeasurementsAndDetails) -> AnyPublisher<Void, Error> {
        Deferred {
            
            Future { promise in
                let FBauth = Auth.auth()
                
                //                guard let uid = FBauth.user.uid else {return}
//                if let uid = FBauth.user.uid {
                    
                    let values = [customerKeys.firstName.rawValue: detailsAndMeasures.clientInfo.firstName,
                                  customerKeys.lasName.rawValue: detailsAndMeasures.clientInfo.lastName,
                                  customerKeys.phone.rawValue: detailsAndMeasures.clientInfo.phone ,
                                  customerKeys.gender.rawValue: detailsAndMeasures.clientInfo.gender.rawValue,
                                  customerKeys.comments.rawValue: detailsAndMeasures.clientInfo.comments] as [String : Any]
                    
                    let db = Firestore.firestore()
                    
                    db.collection("Customers")
//                        .document(detailsAndMeasures.clientInfo.phone)
                        .document("Test")
                        .setData(values) { (error) in
                            
                            if let error = error {
                                promise(.failure(error))
                            } else {
                                promise(.success(()))
                            }
                            
                        }
                    
//                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}
