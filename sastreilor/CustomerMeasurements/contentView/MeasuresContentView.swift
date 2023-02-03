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
    
    @StateObject private var viewModel = MeasuresDataCreationViewModelImpl(
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
                        viewModel.measuresCreation()
                        

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
            HStack{
                TextField(NSLocalizedString("Back", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.back)
                    .lineLimit(1)
                Divider()
                TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.sleeveLength)
                
                
               
            }
            HStack{
                TextField(NSLocalizedString("Elbow Width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.elbowWidth)
                Divider()
                TextField(NSLocalizedString("Fist Width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.fistWidth)
            }
            HStack{
                
               
                TextField(NSLocalizedString("Length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.length)
                Divider()
                
                TextField(NSLocalizedString("Chest Width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.chestWidth)
            }
            HStack{
                TextField(NSLocalizedString("Belly Width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.bellyWidth)
                
                
                Divider()
                TextField(NSLocalizedString("Neck Width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.neckWidth)
                
                
            }
            HStack{
                
                TextField(NSLocalizedString("Vest's Length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments
                    .vestsLength)
                
                Divider()
                
                TextField(NSLocalizedString("Short Sleeve Length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.shortSleeveLength)
                    .multilineTextAlignment(.center)
                
            }
            HStack {
                TextField(NSLocalizedString("Short Sleeve Width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.shortSleeveWidth)
                
                Divider()
                TextField(NSLocalizedString("Armhole length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.armholeLength)
            }
            HStack {
                
                TextField(NSLocalizedString("Back waist Length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.backWaistLength)
                
                Divider()
                TextField(NSLocalizedString("Back overall length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.backOverAllLength)
               
                
            }
            HStack{
                TextField(NSLocalizedString("Armhole width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.armholeWidth)
                Divider()
                TextField(NSLocalizedString("Armhole rounded width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.armholeRoundedWidth)
            }
            
            HStack{
                TextField(NSLocalizedString("Front length", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.frontLength)
                Divider()
                TextField(NSLocalizedString("Shoulder width", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.shoulderWidth)
                
            }
            HStack{
                TextField(NSLocalizedString("Waist", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.waist)
                Divider()
                TextField(NSLocalizedString("Base/Hips", comment: "na"),
                          text: $viewModel.measurementDetails.manShirtsMeasurments.baseHips)
                
            }
            
        } header: {
            Text(NSLocalizedString("Guayabera/Shirt/Vest/Suit Jacket", comment: "na"))
        }
    }
    var womanShirtsMeasurments: some View {
        Section {
            HStack{
                TextField(NSLocalizedString("Back", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.back)
                    .lineLimit(1)
                Divider()
                
                TextField("Length",
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.length)
                Divider()
                
                TextField(NSLocalizedString("Fist Width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.fistWidth)
            }
            HStack{
                TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.sleeveLength)
                Divider()
                
                TextField(NSLocalizedString("Skirt Length", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.skirtLength)
          
            }
            HStack{
                TextField(NSLocalizedString("Neck Width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.neckWidth)
                Divider()
                
                TextField(NSLocalizedString("Elbow Width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.elbowWidth)
            }
            HStack{
                TextField(NSLocalizedString("Bust Width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.chestWidth)
                Divider()
                
                TextField(NSLocalizedString("Belly Width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.bellyWidth)
                
            }
            
            HStack{
                
                TextField(NSLocalizedString("Low Bust", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.lowBust)
                Divider()
                
                TextField(NSLocalizedString("Hight Bust", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.highBust)
            }
            
            HStack{
                TextField(NSLocalizedString("Short Sleeve Width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.shortSleeveWidth)
                Divider()
                
                TextField(NSLocalizedString("Dress Length", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.dressLength)
            }
            
            HStack{
                TextField(NSLocalizedString("armhole width", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.armholeWidth)
                Divider()
                
                TextField(NSLocalizedString("Bust drop", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.bustDrop)
    
            }
            
            HStack{
                TextField(NSLocalizedString("Bust Separation", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.bustSeparation)
                Divider()
                
                TextField(NSLocalizedString("Jacket's Length", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.jacketsLength)
            }
            HStack{
                
                TextField(NSLocalizedString("Waist", comment: "Cintura"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.waist)
                Divider()
                
                TextField(NSLocalizedString("Hips", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.hips)
                
            }
            HStack{
                TextField(NSLocalizedString("Length from bust drop to low Bust", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.lengthfromCaidatoLowBust)
                Divider()
                
                TextField(NSLocalizedString("Mid Hips", comment: "na"),
                          text: $viewModel.measurementDetails.womanShirtsMeasurments.midHips)
            }
        }header: {
            Text(NSLocalizedString("Women's Jacket/blouse/dress/skirt", comment: "na"))
        }
    }
    
    var pantsMeasurments: some View {
        Section {
            HStack{
                TextField(NSLocalizedString("Waist",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.waist)
                    .lineLimit(1)
                Divider()
                TextField(NSLocalizedString("Hips",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.hips)
                
            }
            HStack{
                TextField(NSLocalizedString("fly",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.flyFrontKnuckle)
                Divider()
                TextField(NSLocalizedString("Knee",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.knee)
                
            }
            HStack{
                TextField(NSLocalizedString("Trouser Roll",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.trouserRoll)
                Divider()
                TextField(NSLocalizedString("Length",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.length)
                
            }
            TextField(NSLocalizedString("Rear knucle length",comment: ""),text: $viewModel.measurementDetails.pantsMeasurments.rearKnuckleLength)
      
        }header: {
            Text(NSLocalizedString("Pants",comment: ""))
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
