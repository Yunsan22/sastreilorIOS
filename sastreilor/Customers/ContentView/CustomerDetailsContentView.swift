//
//  MeasurementForm.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/27/23.
//

import SwiftUI

struct CustomerDetailsContentView: View {
    
    @StateObject private var viewModel = CustomerCreationViewModelImpl(
        service: CustDetailsAndMeasuresServiceImpl()
    )
    
    var namespace: Namespace.ID
    @Binding var shouldShowDashboard: Bool
//    @Namespace var namespace
//    @State var shouldShowDashboard = false
    @State private var displayPopupMessage: Bool = false
    
    
    @State private var shouldShowMeasures = false
    
    
    @State var showStatusBar = true
    
    
    
    
    //    @Binding var show: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        
        ZStack{
            ScrollView {
//                if !shouldShowDashboard {
                    customerPrimaryInfo
//                        .onTapGesture {
//                            withAnimation(.spring(response: 0.6,dampingFraction: 0.8) ) {
//                                shouldShowDashboard.toggle()
//                            }
//
//                        }

//                }
               
               
            }
            .preferredColorScheme(.dark)
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: 85)
            })
            .ignoresSafeArea()
            .overlay(
                Button {
                    withAnimation(.spring(response: 0.6,dampingFraction: 0.8)) {
                        displayPopupMessage.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundColor(.secondary)
                        .padding(12)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                .padding(20)
                .offset(y:20)
                .ignoresSafeArea()
                .alert(isPresented: $displayPopupMessage){
                    Alert(title: Text("Warning"),
                          message: Text("All data will be deleted"),
                          dismissButton: .default(Text("OK"), action: {
                        shouldShowDashboard.toggle()
                        print("Dis is customer details")
                        print("thisclicked")
    //                    handleDismissal()
                    })
                    )
                }
            )
//            if shouldShowDashboard {
//                theView()
////                theView(n amespace: namespace, show: $shouldShowDashboard)
//            }
           
            
            
        }
        .statusBarHidden(!showStatusBar)
        .onChange(of: shouldShowDashboard) { newValue in
            withAnimation(.spring(response: 0.6,dampingFraction: 0.8) ) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }

        }
        .background(
            ZStack{
                Color.black
                RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 1200,height: 450)
                    .rotationEffect(.degrees(135))
                    .offset(y:-400)
                
            })
        .preferredColorScheme(.dark)
        
        
        
        
        
        
        
    }
    var customerPrimaryInfo: some View {
        VStack{
           
            clientInfo
            address
            ButtonView(title: "Save and Continue",
                       background: .clear,
                       border: .blue) {
//                shouldShowDashboard.toggle()
                showStatusBar = false
                                shouldShowMeasures.toggle()
                print($showStatusBar)
                //this below save to Firebase
                //trying alternative way to save to firestore
                viewModel.custumerCreation()
                
            }
            
                       .fullScreenCover(isPresented: $shouldShowMeasures, content: {
                           
                           //                    MeasuresContentView()
                           theView()
                           
                       })
            //                        .disabled(!viewModel.isValid)
            clearAll
        }
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 20)
        })
        
    }
    
}

struct MeasurementForm_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        //        MeasurementContentView{_ in}
        CustomerDetailsContentView(namespace: namespace,shouldShowDashboard: .constant(true))
//        CustomerDetailsContentView()
    }
}

private extension CustomerDetailsContentView {
    var clientInfo: some View {
        
        Section {
            InputTextFieldView(text: $viewModel.customerDetails.clientInfo.firstName, placeholder: "First Name", keyboardType: .default, sfSymbol: nil)
            
            InputTextFieldView(text: $viewModel.customerDetails.clientInfo.lastName, placeholder: "Last Name", keyboardType: .default, sfSymbol: nil)
            
            Picker("Gender", selection: $viewModel.customerDetails.clientInfo.gender) {
                ForEach(CustomersMeasurementsAndDetails.ClientInfo.Gender.allCases) { Item in
                    Text(Item.rawValue.uppercased())
                }
            }
            //            Picker("Pronouns", selection: $viewModel.customerDetails.clientInfo.pronoun) {
            //                ForEach(CustomersMeasurementsAndDetails.ClientInfo.Pronouns.allCases) { Item in
            //                    Text(Item.rawValue.uppercased())
            //                }
            //            }
            
            InputTextFieldView(text: $viewModel.customerDetails.clientInfo.phone, placeholder: "Phone", keyboardType: .phonePad, sfSymbol: nil)
            
            InputTextFieldView(text: $viewModel.customerDetails.clientInfo.comments, placeholder: "Comments", keyboardType: .default, sfSymbol: nil)
            
            
        } header: {
            Text(NSLocalizedString("Customer information", comment: "na")).font(.largeTitle).font(.footnote)
        }
        .headerProminence(.increased)
        
        
    }
    
    var address: some View {
        
        Section {
            
            InputTextFieldView(text: $viewModel.customerDetails.address.streetAddress, placeholder: "Street Address", keyboardType: .default, sfSymbol: nil)
            
            InputTextFieldView(text: $viewModel.customerDetails.address.city, placeholder: "City", keyboardType: .default, sfSymbol: nil)
            
            InputTextFieldView(text: $viewModel.customerDetails.address.stateProvidence, placeholder: "State/Providence", keyboardType: .default, sfSymbol: nil)
            
            InputTextFieldView(text: $viewModel.customerDetails.address.postalCode, placeholder: "Postal Code", keyboardType: .default, sfSymbol: nil)
            
            
            InputTextFieldView(text: $viewModel.customerDetails.address.country, placeholder: "Country", keyboardType: .default, sfSymbol: nil)
            
            
        } header: {
            Text(NSLocalizedString("Mailing Address", comment: "na")).font(.largeTitle).font(.footnote)
        } footer: {
            Text(LocalizedStringKey("If you go back before saving all data will be lost"))
                .font(.footnote)
        }
        .headerProminence(.increased)
        
        
    }
    
    var manShirtsMeasurments: some View {
        Section {
            HStack{
                TextField(NSLocalizedString("Back", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.back)
                .lineLimit(1)
                Divider()
                
                TextField(NSLocalizedString("Fist Width", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.fistWidth)
                
            }
            HStack{
                TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.sleeveLength)
                Divider()
                
                TextField(NSLocalizedString("Elbow Width", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.elbowWidth)
            }
            HStack{
                
                TextField(NSLocalizedString("Chest Width", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.chestWidth)
                Divider()
                
                TextField(NSLocalizedString("Belly Width", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.bellyWidth)
            }
            HStack{
                
                TextField(NSLocalizedString("Neck Width", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.neckWidth)
                Divider()
                
                TextField(NSLocalizedString("Jacket's Length", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.jacketsLength)
                
            }
            HStack{
                
                TextField(NSLocalizedString("Length", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.length)
                Divider()
                
                TextField(NSLocalizedString("Short Sleeve Width", comment: "na"),
                          text: $viewModel.customerDetails.manShirtsMeasurments.shortSleeveWidth)
                .multilineTextAlignment(.center)
                
            }
        } header: {
            Text(NSLocalizedString("Guayabera/Shirt/jacket", comment: "na"))
        }
    }
    var womanShirtsMeasurments: some View {
        Section {
            HStack{
                TextField(NSLocalizedString("Back", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.back)
                .lineLimit(1)
                Divider()
                
                TextField("Length",
                          text: $viewModel.customerDetails.womanShirtsMeasurments.length)
                Divider()
                
                TextField(NSLocalizedString("Fist Width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.fistWidth)
            }
            HStack{
                TextField(NSLocalizedString("Sleeve Length", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.sleeveLength)
                Divider()
                
                TextField(NSLocalizedString("Skirt Length", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.skirtLength)
                
            }
            HStack{
                TextField(NSLocalizedString("Neck Width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.neckWidth)
                Divider()
                
                TextField(NSLocalizedString("Elbow Width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.elbowWidth)
            }
            HStack{
                TextField(NSLocalizedString("Bust Width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.chestWidth)
                Divider()
                
                TextField(NSLocalizedString("Belly Width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.bellyWidth)
                
            }
            
            HStack{
                
                TextField(NSLocalizedString("Low Bust", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.lowBust)
                Divider()
                
                TextField(NSLocalizedString("Hight Bust", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.highBust)
            }
            
            HStack{
                TextField(NSLocalizedString("Short Sleeve Width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.shortSleeveWidth)
                Divider()
                
                TextField(NSLocalizedString("Dress Length", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.dressLength)
            }
            
            HStack{
                TextField(NSLocalizedString("armhole width", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.armholeWidth)
                Divider()
                
                TextField(NSLocalizedString("Bust drop", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.bustDrop)
                
            }
            
            HStack{
                TextField(NSLocalizedString("Bust Separation", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.bustSeparation)
                Divider()
                
                TextField(NSLocalizedString("Jacket's Length", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.jacketsLength)
            }
            HStack{
                
                TextField(NSLocalizedString("Waist", comment: "Cintura"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.waist)
                Divider()
                
                TextField(NSLocalizedString("Hips", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.hips)
                
            }
            HStack{
                TextField(NSLocalizedString("Length from bust drop to low Bust", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.lengthfromCaidatoLowBust)
                Divider()
                
                TextField(NSLocalizedString("Mid Hips", comment: "na"),
                          text: $viewModel.customerDetails.womanShirtsMeasurments.midHips)
            }
        }header: {
            Text(NSLocalizedString("Women's Jacket/blouse/dress/skirt", comment: "na"))
        }
    }
    
    var pantsMeasurments: some View {
        Section {
            HStack{
                TextField("Back",text: $viewModel.customerDetails.pantsMeasurments.length)
                    .lineLimit(1)
                TextField("Length",text: $viewModel.customerDetails.pantsMeasurments.length)
                TextField("Fist Width",text: $viewModel.customerDetails.pantsMeasurments.length)
            }
            HStack{
                TextField("Sleeve Length",text: $viewModel.customerDetails.pantsMeasurments.length)
                TextField("Elbow Width",text: $viewModel.customerDetails.pantsMeasurments.length)
            }
            HStack{
                
                TextField("Chest Width",text: $viewModel.customerDetails.pantsMeasurments.length)
                TextField("Belly Width",text: $viewModel.customerDetails.pantsMeasurments.length)
                TextField("Neck Width",text: $viewModel.customerDetails.pantsMeasurments.length)
            }
            
        }header: {
            Text("Pants")
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
extension CustomerDetailsContentView {
    func handleDismissal(){
        if #available(iOS 15, *) {
            dismiss()
        }else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
