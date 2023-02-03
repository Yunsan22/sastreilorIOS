//
//  NewCustomer.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/28/23.
//

import Foundation
import SwiftUI

struct NewCustomer {
    var clientInfo: ClientInfo
    var address: Address
    var manShirtsMeasurments: ManShirtsMeasurements
    var womanShirtsMeasurments: WomanShirtsMeasurments
    var pantsMeasurments: PantsMeasurments
}

extension NewCustomer {
    struct ClientInfo {
        var firstName: String
        var lastName: String
        var gender: Gender
        var pronoun: Pronouns
        var phone: String
        var bodyType: String
        var comments: String
    }
}
extension NewCustomer.ClientInfo {
    enum Gender: String, Identifiable, CaseIterable {
        var id: Self { self}
        case male
        case female
        case intersex
        case transgender
        case genderneutral = "Gender neutral"
        case nonbinary = "non-binary"
        case agender
        case pangender
        case genderqueer
        case twospirit = "two-spirit"
        case na = "Prefer not to say"
    }
}
extension NewCustomer.ClientInfo {
    enum Pronouns: String, Identifiable, CaseIterable {
        var id: Self { self}
        case ime = "(I,me)"
        case you = "(you)"
        case she = "(she,her,hers)"
        case he = "(he,him,his)"
        case they = "(they,them,theirs)"
        case ze = "ze,hir,hirs"
        case na = "Prefer not to say"
    }
}
extension NewCustomer{
    struct Address {
        var streetAddress: String
        var city: String
        var stateProvidence: String
        var postalCode: String
        var country: String
    }
}

extension NewCustomer {
    struct ManShirtsMeasurements {
        var back: String
        var fistWidth: String
        var sleeveLength: String
        var elbowWidth: String
        var chestWidth: String
        var bellyWidth: String
        var neckWidth: String
        var jacketsLength: String
        var length: String
        var shortSleeveWidth: String
    }
    
}
extension NewCustomer {
    struct WomanShirtsMeasurments {
        var back: String
        var fistWidth: String
        var sleeveLength: String
        var elbowWidth: String
        var chestWidth: String
        var bellyWidth: String
        var neckWidth: String
        var jacketsLength: String
        var length: String
        var shortSleeveWidth: String
        var skirtLength: String
        var bustWidth: String
        var lowBust: String
        var highBust: String
        var dressLength: String
        var armholeWidth: String
        var bustDrop: String
        var bustSeparation: String
        var waist: String
        var hips: String
        var lengthfromCaidatoLowBust: String
        var midHips: String
    }
    
}
extension NewCustomer {
    struct PantsMeasurments {
        var length: String
    }
}

extension NewCustomer {
    static var empty: NewCustomer {
        let clientInfo = NewCustomer.ClientInfo(firstName: "",
                                                lastName: "",
                                                gender: ClientInfo.Gender.allCases.first!,
                                                pronoun: ClientInfo.Pronouns.allCases.first!,
                                                phone: "",
                                                bodyType: "",
                                                comments: "")
        let address = NewCustomer.Address(streetAddress: "",
                                          city: "",
                                          stateProvidence: "",
                                          postalCode: "",
                                          country: "")
        let manShirtsMeasurments = NewCustomer.ManShirtsMeasurements(back: "",
                                                                     fistWidth: "",
                                                                     sleeveLength: "",
                                                                     elbowWidth: "",
                                                                     chestWidth: "",
                                                                     bellyWidth: "",
                                                                     neckWidth: "",
                                                                     jacketsLength: "",
                                                                     length: "",
                                                                     shortSleeveWidth: "")
        let womanShirtsMeasurments = NewCustomer.WomanShirtsMeasurments(back: "", fistWidth: "", sleeveLength: "", elbowWidth: "", chestWidth: "", bellyWidth: "", neckWidth: "", jacketsLength: "", length: "", shortSleeveWidth: "", skirtLength: "", bustWidth: "", lowBust: "", highBust: "", dressLength: "", armholeWidth: "", bustDrop: "", bustSeparation: "", waist: "", hips: "", lengthfromCaidatoLowBust: "", midHips: "")
        
        let pantsMeasurments = NewCustomer.PantsMeasurments(length: "")
        
        return NewCustomer(clientInfo: clientInfo, address: address, manShirtsMeasurments: manShirtsMeasurments, womanShirtsMeasurments: womanShirtsMeasurments, pantsMeasurments: pantsMeasurments)
    }
}
