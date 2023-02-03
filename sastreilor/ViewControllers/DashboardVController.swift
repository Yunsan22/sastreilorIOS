//
//  MeasurmentsVController.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/1/23.
//

import Foundation
import SwiftUI

struct DashboardVController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> DashboardVC {
        let vc = DashboardVC()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DashboardVC, context: Context) {
        
    }
//    //the below is not needed
//    typealias UIViewControllerType = DashboardVC
//
// different way to intantiate storyboard
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
//        return vc
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//
    
}
