//
//  MenMeasures.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/4/23.
//

import SwiftUI

struct MenMeasuresView: View {
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
        
        
        NavigationStack {
            ScrollView {
                ZStack{
                   
                }
                .preferredColorScheme(.dark)
                .navigationTitle("Men Measures")
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
                .background(
                        ZStack{
                            Color.black
                            RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
                                .rotationEffect(.degrees(135))
                                .offset(y:-50)
                            
                        })
            .preferredColorScheme(.dark)
                //                butonview
                                manShirtsMeasurments
                clearAll
            }
            
            
        }

    }
}

struct MenMeasuresView_Previews: PreviewProvider {
    static var previews: some View {
        MenMeasuresView()
    }
}

private extension MenMeasuresView {
    
    
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
extension MenMeasuresView {
    func handleDismissal(){
        if #available(iOS 15, *) {
            dismiss()
        }else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
