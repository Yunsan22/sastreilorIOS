//
//  MeasuresService.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/31/23.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

enum MeasuresKeys: String {
    
    case back
    case sleeveLength
    case fistWidth
}

protocol SuitMeasuresService {
    func createMeasures(with DetailsMeasures: SuitMeasuresDetails) -> AnyPublisher<Void, Error>
}

final class MeasuresServiceImpl: SuitMeasuresService {
    
    
    func createMeasures(with DetailsMeasures: SuitMeasuresDetails) -> AnyPublisher<Void, Error> {
        Deferred {
            
            Future { promise in
                let FBauth = Auth.auth()
                
                //                guard let uid = FBauth.user.uid else {return}
                //                if let uid = FBauth.user.uid {
                
                let values = [MeasuresKeys.back.rawValue: DetailsMeasures.manShirtsMeasurments.back,
                              MeasuresKeys.sleeveLength.rawValue: DetailsMeasures.manShirtsMeasurments.sleeveLength,
                              MeasuresKeys.fistWidth.rawValue: DetailsMeasures.manShirtsMeasurments.fistWidth
                ] as [String : Any]
                
                let db = Firestore.firestore()
                
                db.collection("Customers")
                    .document("Test")
//                    .document(DetailsMeasures.manShirtsMeasurments.sleeveLength)
                    .setData(values, merge: true) { (error) in
                        
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
