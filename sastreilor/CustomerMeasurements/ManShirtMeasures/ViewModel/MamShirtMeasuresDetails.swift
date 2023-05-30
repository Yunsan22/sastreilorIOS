//
//  MeasuresDetails.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/31/23.
//

import Foundation

//aditional fields will be added for the measurments
struct MamShirtMeasuresDetails: Identifiable {
    var id: String
    var manShirtMeasurments: ManShirtMeasurements
    
}


extension MamShirtMeasuresDetails {
    struct ManShirtMeasurements {
        var back: String
        var sleeveLength: String
        var elbowWidth: String
        var fistWidth: String
        var length: String
        var chestWidth: String
        var bellyWidth: String
        var neckWidth: String
        var shortSleeveLength: String
        var shortSleeveWidth: String
        
//        var vestsLength: String
//        var armholeLength: String//new
//        var armholeWidth: String
//        var backWaistLength: String //talle trasero
//        var backOverAllLength: String //largo total trasero
//        var armholeRoundedWidth: String //ancho de sisa redondo
//        var frontLength: String //largo delantero
//        var shoulderWidth: String //
//        var waist: String
//        var baseHips: String //base of cadera
    }
    
}

extension MamShirtMeasuresDetails {
    static var new: MamShirtMeasuresDetails {
        MamShirtMeasuresDetails(id: "", manShirtMeasurments: ManShirtMeasurements(back: "", sleeveLength: "", elbowWidth: "", fistWidth: "", length: "", chestWidth: "", bellyWidth: "", neckWidth: "", shortSleeveLength: "", shortSleeveWidth: ""))
       
    }
}

