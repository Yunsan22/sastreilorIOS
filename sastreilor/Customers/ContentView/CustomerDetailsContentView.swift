//
//  MeasurementForm.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/27/23.
//

import SwiftUI

struct CustomerDetailsContentView: View {
    
    @State private var shouldShowMeasures = false
    @State private var displayPopupMessage: Bool = false
    
    @StateObject private var viewModel = CustomerCreationViewModelImpl(
        service: CustDetailsAndMeasuresServiceImpl()
    )
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    //    @StateObject private var viewModel = CreateCustomerViewModel()
    //    let action: (_ customer: NewCustomer) -> Void
    
    init(){
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.green]
//
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.green]
    }
    var body: some View {
        NavigationView {
            
            ZStack {
               
                VStack {
                    Form {
                        
                        clientInfo
                        address
                        //                butonview
                        //                manShirtsMeasurments
                        //                womanShirtsMeasurments
                        //                pantsMeasurments
                        clearAll
                        
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
                        .rotationEffect(.degrees(135))
                        .offset(y:-365)
                }.layoutPriority(-1)
               
            }
            
            .preferredColorScheme(.dark)
            .navigationTitle("Part 1")
            .toolbar {
                
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button("Next") {
                        shouldShowMeasures.toggle()

                        //this below save to Firebase
                        //trying alternative way to save to firestore
                        viewModel.custumerCreation()

                        //dismmiss
//                        handleDismissal()
                        
                    }
                
                    .fullScreenCover(isPresented: $shouldShowMeasures, content: {
                        
                        MeasuresContentView()
                       
                    })
                    .disabled(!viewModel.isValid)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel",role: .cancel){
                        displayPopupMessage.toggle()
                    }
                    .alert(isPresented: $displayPopupMessage){
                        Alert(title: Text("Warning"),
                              message: Text("This is a test"),
                              dismissButton: .default(Text("OK"), action: {
                                        print("Ok Click")
                                    print("thisclicked")
                            handleDismissal()
                                    })
                                    )
                    }
                }
                

            }
            
            
        }

       
    }
    
}

struct MeasurementForm_Previews: PreviewProvider {
    static var previews: some View {
        //        MeasurementContentView{_ in}
        CustomerDetailsContentView()
    }
}

private extension CustomerDetailsContentView {
    var clientInfo: some View {
        Section {
            TextField(NSLocalizedString("First Name", comment: "na"),
                      text: $viewModel.customerDetails.clientInfo.firstName)
            .textContentType(.name)
            .keyboardType(.namePhonePad)
            
            TextField(NSLocalizedString("Last Name", comment: "na"),
                      text: $viewModel.customerDetails.clientInfo.lastName)
            .textContentType(.familyName)
            .keyboardType(.namePhonePad)
            
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
            
            TextField(NSLocalizedString("Phone",comment: "na"),
                      text: $viewModel.customerDetails.clientInfo.phone)
            .textContentType(.telephoneNumber)
            .keyboardType(.phonePad)
            
            
            TextField(NSLocalizedString("Comments",comment: "na"),
                      text: $viewModel.customerDetails.clientInfo.comments)
        } header: {
            Text(NSLocalizedString("Customer information", comment: "na"))
        }
        .headerProminence(.increased)
    }
    
    var address: some View {
        Section {
            TextField(NSLocalizedString("Street Address", comment: "na"),
                      text: $viewModel.customerDetails.address.streetAddress )
            .textContentType(.streetAddressLine1)
            
            TextField(NSLocalizedString("City", comment: "na"),
                      text: $viewModel.customerDetails.address.city )
            .textContentType(.addressCity)
            
            TextField(NSLocalizedString("State/Providence", comment: "na"),
                      text: $viewModel.customerDetails.address.stateProvidence )
            .textContentType(.addressState)
            
            TextField(NSLocalizedString("Postal Code", comment: "na"),
                      text: $viewModel.customerDetails.address.postalCode )
            .textContentType(.postalCode)
            
            TextField(NSLocalizedString("Country", comment: "na"),
                      text: $viewModel.customerDetails.address.country )
            .textContentType(.countryName)
            
        } header: {
            Text(NSLocalizedString("Mailing Address", comment: "na"))
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
