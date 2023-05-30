//
//  MeasuresContentView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/31/23.
//

import SwiftUI
import UIKit

struct MeasuresContentView: View {
    
    @State private var shouldShowDashboard = false
    
    @StateObject private var viewModel = SuitMeasuresDataCreationViewModelImpl(
        service: MeasuresServiceImpl()
    )
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        conten
    }
    
    
    
    var conten: some View {
        NavigationView {
            VStack {
                Form {
                    
                    
    //                butonview
                    manShirtsMeasurments
                    womanShirtsMeasurments
                    pantsMeasurments
                    clearAll
          
                }
                
                

                }
            .preferredColorScheme(.dark)
            .navigationTitle("Measures")
            .toolbar {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }, label: {
//                    Text("Save and Exit")
//                })
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save and Exit") {
                        shouldShowDashboard.toggle()
                        //this below save to Firebase
                        //trying alternative way to save to firestore
                        viewModel.suitMeasuresCreation()
                        

                        //dismmiss
                        handleDismissal()
//                        let contenview = UIViewRepresentable
                    }
//                    .fullScreenCover(isPresented: $shouldShowDashboard, content: {
//                        DashboardVController()
//                    })
                    .disabled(!viewModel.isValid)
                }
            }
            
        }
        
        
        
    }
}

struct MeasuresContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeasuresContentView()
    }
}

private extension MeasuresContentView {
    
    
    var manShirtsMeasurments: some View {
        Section {
            
            Group {
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.back, placeholder: "Back", keyboardType: .decimalPad, sfSymbol: nil)
                    
                        InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.sleeveLength, placeholder: "Sleeve Length", keyboardType: .decimalPad, sfSymbol: nil)
                }
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.elbowWidth, placeholder: "Elbow Width", keyboardType: .decimalPad, sfSymbol: nil)
                    
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.fistWidth, placeholder: "Fist Width", keyboardType: .decimalPad, sfSymbol: nil)
                    
                }
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.length, placeholder: "Length", keyboardType: .decimalPad, sfSymbol: nil)
                       
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.baseHips, placeholder: "Base/Hips", keyboardType: .decimalPad, sfSymbol: nil)
                    
                }
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.bellyWidth, placeholder: "Belly Width", keyboardType: .decimalPad, sfSymbol: nil)
                    
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.neckWidth, placeholder: "Neck Width", keyboardType: .decimalPad, sfSymbol: nil)
                }
                HStack {
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.vestsLength, placeholder: "Vest's Length", keyboardType: .decimalPad, sfSymbol: nil)
                }
                    
            
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.shortSleeveLength, placeholder: "Short Sleeve Length", keyboardType: .decimalPad, sfSymbol: nil)
                    
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.shortSleeveWidth, placeholder: "Short Sleeve Width", keyboardType: .decimalPad, sfSymbol: nil)
     
                HStack {
    
    
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.armholeLength, placeholder: "Armhole length", keyboardType: .decimalPad, sfSymbol: nil)
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.backWaistLength, placeholder: "Back waist Length", keyboardType: .decimalPad, sfSymbol: nil)
                }
            
            }
            Group{
                HStack {
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.backOverAllLength, placeholder: "Back overall length", keyboardType: .decimalPad, sfSymbol: nil)
                   
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.armholeWidth, placeholder: "Armhole width", keyboardType: .decimalPad, sfSymbol: nil)
                    
                }
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.armholeRoundedWidth, placeholder: "Armhole rounded width", keyboardType: .decimalPad, sfSymbol: nil)
                  
                }
                
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.frontLength, placeholder: "Front length", keyboardType: .decimalPad, sfSymbol: nil)
                  
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.waist, placeholder: "Waist", keyboardType: .decimalPad, sfSymbol: nil)
                    
                    
                }
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.shoulderWidth, placeholder: "Shoulder width", keyboardType: .decimalPad, sfSymbol: nil)
               
                }
                InputTextFieldView(text: $viewModel.suitMeasurementDetails.manShirtsMeasurments.chestWidth, placeholder: "Chest Width", keyboardType: .decimalPad, sfSymbol: nil)
            }
            
            
        } header: {
            Text(NSLocalizedString("Guayabera/Shirt/Vest/Suit Jacket", comment: "na"))
        }
    }
    
    var womanShirtsMeasurments: some View {
        VStack {
            Section {
                HStack{
                    TextField(NSLocalizedString("Back", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.back)
                        .lineLimit(1)
                    Divider()
                    
                    TextField("Length",
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.length)
                    Divider()
                    
                    TextField(NSLocalizedString("Fist Width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.fistWidth)
                }
                HStack{
                    TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.sleeveLength)
                    Divider()
                    
                    TextField(NSLocalizedString("Skirt Length", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.skirtLength)
              
                }
                HStack{
                    TextField(NSLocalizedString("Neck Width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.neckWidth)
                    Divider()
                    
                    TextField(NSLocalizedString("Elbow Width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.elbowWidth)
                }
                HStack{
                    TextField(NSLocalizedString("Bust Width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.chestWidth)
                    Divider()
                    
                    TextField(NSLocalizedString("Belly Width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.bellyWidth)
                    
                }
                
                HStack{
                    
                    TextField(NSLocalizedString("Low Bust", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.lowBust)
                    Divider()
                    
                    TextField(NSLocalizedString("Hight Bust", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.highBust)
                }
                
                HStack{
                    TextField(NSLocalizedString("Short Sleeve Width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.shortSleeveWidth)
                    Divider()
                    
                    TextField(NSLocalizedString("Dress Length", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.dressLength)
                }
                
                HStack{
                    TextField(NSLocalizedString("armhole width", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.armholeWidth)
                    Divider()
                    
                    TextField(NSLocalizedString("Bust drop", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.bustDrop)
        
                }
                
                HStack{
                    TextField(NSLocalizedString("Bust Separation", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.bustSeparation)
                    Divider()
                    
                    TextField(NSLocalizedString("Jacket's Length", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.jacketsLength)
                }
                HStack{
                    
                    TextField(NSLocalizedString("Waist", comment: "Cintura"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.waist)
                    Divider()
                    
                    TextField(NSLocalizedString("Hips", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.hips)
                    
                }
                HStack{
                    TextField(NSLocalizedString("Length from bust drop to low Bust", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.lengthfromCaidatoLowBust)
                    Divider()
                    
                    TextField(NSLocalizedString("Mid Hips", comment: "na"),
                              text: $viewModel.suitMeasurementDetails.womanShirtsMeasurments.midHips)
                }
            }header: {
                Text(NSLocalizedString("Women's Jacket/blouse/dress/skirt", comment: "na"))
        }
        }
    }
    
    var pantsMeasurments: some View {
        VStack {
            Section {
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.waist, placeholder: "Waist", keyboardType: .decimalPad, sfSymbol: nil)
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.hips, placeholder: "Hips", keyboardType: .decimalPad, sfSymbol: nil)
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.flyFrontKnuckle, placeholder: "fly", keyboardType: .decimalPad, sfSymbol: nil)
                }
                HStack{
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.knee, placeholder: "Knee", keyboardType: .decimalPad, sfSymbol: nil)
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.trouserRoll, placeholder: "Trouser Roll", keyboardType: .decimalPad, sfSymbol: nil)
                    InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.length, placeholder: "Length", keyboardType: .decimalPad, sfSymbol: nil)
                }
                InputTextFieldView(text: $viewModel.suitMeasurementDetails.pantsMeasurments.rearKnuckleLength, placeholder: "Rear knucle length", keyboardType: .decimalPad, sfSymbol: nil)
                
            }header: {
                Text(NSLocalizedString("Pants",comment: ""))
        }
        }
    }
    var butonview:some View {
        Section {
            ButtonView(title: "Save and Continue") {
                
            }
        }
    }
    var clearAll: some View {
        Button(role: .destructive) {
            withAnimation {
                viewModel.clearAll()
            }
            
        }label: {
            Text(NSLocalizedString("Clear All", comment: "na"))
        }
        
    }
    
    
}
extension MeasuresContentView {
    func handleDismissal(){
        if #available(iOS 15, *) {
            dismiss()
        }else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
