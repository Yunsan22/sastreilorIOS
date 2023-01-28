//
//  MeasurementForm.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/27/23.
//

import SwiftUI

struct MeasurementForm: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var phoneNumber = ""
    @State var BodyType = ""
    @State var comments = ""
    @State var streetAddress = ""
    @State var city = ""
    @State var stateprovince = ""
    @State var postalCode = ""
    @State var country = ""
    @State var back = ""
    @State var sleeveLength = ""
    @State var elbowWidth = ""
    @State var fistWidth = ""
    @State var Length = ""
    @State var chestWidth = ""
    @State var bellyWidth = ""
    @State var neckWidth = ""
    @State var shortSleevWidth = ""
    @State var jacketLength = ""
    @State var womenBack = ""
    @State var womenJacketLength = ""
    @State var womenSleeveLength = ""
    @State var womenElbowWidth = ""
    @State var womenFistWidth = ""
    @State var womenLength = ""
    @State var womenChestWidth = ""
    @State var womenBellyWidth = ""
    @State var womenNeckWidth = ""
    @State var womenShortSleevWidth = ""
    @State var sisaWidth = ""
    @State var Waist = ""
    @State var Hips = ""
    @State var caidadeBust = ""
    @State var bustSeparation = ""
    @State var lowBust = ""
    @State var highBust = ""
    @State var lengthfromCaidatoLowBust = ""
    @State var dressLength = ""
    @State var midHips = ""
    @State var skirtLEngth = ""
    
    var body: some View {
    
        conten
    }
    
    
    var conten: some View {
        VStack {
            Form {
                
                Section(header: Text("Customer Information")) {
                    
                    TextField(NSLocalizedString("First Name", comment: "na"),
                              text: $firstName)
                    
                    TextField(NSLocalizedString("Last Name", comment: "na"),
                              text: $lastName)
                    
                    TextField(NSLocalizedString("Phone",comment: "na"),
                              text: $phoneNumber)
                    .keyboardType(.phonePad)
                    TextField("Body Type",
                              text: $BodyType)
                    
                    TextField(NSLocalizedString("Comments",comment: "na"),
                              text: $comments)
                }
                
                let mailing = NSLocalizedString("Mailing Address", comment: "na")
                
                Section(header: Text(mailing)){
                    TextField(NSLocalizedString("Street Address", comment: "na"),
                              text: $streetAddress )
                    TextField(NSLocalizedString("City", comment: "na"),
                              text: $city )
                    TextField(NSLocalizedString("State/Providence", comment: "na"),
                              text: $stateprovince )
                    TextField(NSLocalizedString("Postal Code", comment: "na"),
                              text: $postalCode )
                    TextField(NSLocalizedString("Country", comment: "na"),
                              text: $country )
                }
                let headerTitle2 = NSLocalizedString("Guayabera/Shirt/jacket", comment: "na")
                Section(header: Text(headerTitle2)) {
                    
                    HStack{
                        TextField(NSLocalizedString("Back", comment: "na"),
                                  text: $back)
                            .lineLimit(1)
                        TextField(NSLocalizedString("Fist Width", comment: "na"),
                                  text: $fistWidth)
                    }
                    HStack{
                        TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                                  text: $sleeveLength)
                        TextField(NSLocalizedString("Elbow Width", comment: "na"),
                                  text: $elbowWidth)
                    }
                    HStack{
                        
                        TextField(NSLocalizedString("Chest Width", comment: "na"),
                                  text: $chestWidth)
                        TextField(NSLocalizedString("Belly Width", comment: "na"),
                                  text: $bellyWidth)
                    }
                    HStack{
                        
                        TextField(NSLocalizedString("Neck Width", comment: "na"),
                                  text: $neckWidth)
                        TextField(NSLocalizedString("Jacket's Length", comment: "na"),
                                  text: $jacketLength)
                        
                    }
                    HStack{
                        
                    TextField("Length",
                              text: $Length)
                        TextField("Short Sleeve Width",
                                  text: $shortSleevWidth)
                            .multilineTextAlignment(.center)
                        
                    }
                    
                }
                Section(header: Text("Women's Jacket/blouse/dress/skirt")) {
                    
                    HStack{
                        TextField(NSLocalizedString("Back", comment: "na"),
                                  text: $womenBack)
                            .lineLimit(1)
                        TextField("Length",
                                  text: $Length)
                        TextField(NSLocalizedString("Fist Width", comment: "na"),
                                  text: $womenFistWidth)
                    }
                    HStack{
                        TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                                  text: $womenSleeveLength)
                        TextField("Skirt Length",
                                  text: $skirtLEngth)
                  
                    }
                    HStack{
                        TextField(NSLocalizedString("Neck Width", comment: "na"),
                                  text: $womenNeckWidth)
                        TextField(NSLocalizedString("Elbow Width", comment: "na"),
                                  text: $womenElbowWidth)
                    }
                    HStack{
                        TextField("Bust Width",
                                  text: $chestWidth)
                        TextField("Belly Width",
                                  text: $bellyWidth)
                        
                    }
                    
                    HStack{
                        
                        TextField("Low Bust",
                                  text: $lowBust)
                        TextField("Hight Bust",
                                  text: $highBust)
                    }
                    
                    HStack{
                        TextField("Short Sleeve Width",
                                  text: $womenShortSleevWidth)
                        
                        TextField("Dress Length",
                                  text: $dressLength)
                    }
                    
                    HStack{
                        TextField("Sisa width",
                                  text: $sisaWidth)
                        TextField("caida de busto",
                                  text: $caidadeBust)
            
                    }
                    
                    HStack{
                        TextField("Bust Separation",
                                  text: $bustSeparation)
                        TextField(NSLocalizedString("Jacket's Length", comment: "na"),
                                  text: $womenJacketLength)
                    }
                    HStack{
                        
                        TextField(NSLocalizedString("Waist", comment: "Cintura"),
                                  text: $Waist)
                        
                        TextField("Hips",
                                  text: $Hips)
                        
                    }
                    HStack{
                        TextField("Length from caida to low Bust",
                                  text: $lengthfromCaidatoLowBust)
                        TextField("Mid Hips",
                                  text: $midHips)
                    }
                    
                    
                    
                    
                }
                Section(header: Text("Pants")) {
                    
                    HStack{
                        TextField("Back",text: $back)
                            .lineLimit(1)
                        TextField("Length",text: $Length)
                        TextField("Fist Width",text: $fistWidth)
                    }
                    HStack{
                        TextField("Sleeve Length",text: $sleeveLength)
                        TextField("Elbow Width",text: $elbowWidth)
                    }
                    HStack{
                        
                        TextField("Chest Width",text: $chestWidth)
                        TextField("Belly Width",text: $bellyWidth)
                        TextField("Neck Width",text: $neckWidth)
                    }
                    
                    
                }
                
                
            }
            .navigationTitle("Measurements")
        }
        
    }
}

struct MeasurementForm_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementForm()
    }
}
