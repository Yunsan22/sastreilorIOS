//
//  MenTopsMeasuresView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/5/23.
//

import SwiftUI

struct MenSuitsMeasuresView: View {
    
    @StateObject private var viewModel = SuitMeasuresDataCreationViewModelImpl(
        service: MeasuresServiceImpl()
    )
    @State private var displayPopupMessage: Bool = false
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var namespace: Namespace.ID
    @Binding var show: Bool
//    @Namespace var namespace
//    @State var show = false
    
    @State var showPreviousView = false
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
            }.safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: 44)
            })
            .ignoresSafeArea()
            
            Button {
                withAnimation(.spring(response: 0.6,dampingFraction: 0.8)) {
                    displayPopupMessage.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(15)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            .padding(20)
//            .offset(y: 40)
            .ignoresSafeArea()
            .alert(isPresented: $displayPopupMessage){
                Alert(title: Text("Warning"),
                      message: Text("all your progress will be lost"),
                      dismissButton: .default(Text("OK"), action: {
                    show.toggle()
                    print("Dis is cments tops")
                    print("thisclicked")
//                    handleDismissal()
                })
                )
            }
            
            
            
        }
        .background(
            //            Image("Rectangle 1")
            ////            Image("Rectangle_110__2_-removebg-preview")
            //
            //                .resizable()
            //                .aspectRatio(contentMode: .fill)
            //                .matchedGeometryEffect(id: "background", in: namespace)
            //                    in:
            ZStack{
                Color.black
                RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
                    .rotationEffect(.degrees(135))
                    .offset(y:-400)
                    .matchedGeometryEffect(id: "background", in: namespace)
                
            }
            
        )
        .preferredColorScheme(.dark)
        
    }
    
    var cover: some View {
        VStack{
            Spacer()
            VStack  {
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Text("Men Tops")
                        .font(.largeTitle.weight(.bold))
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    Text("Here you can find men's tops measures".uppercased())
                        .font(.footnote.weight(.semibold))
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .matchedGeometryEffect(id: "subtitles", in: namespace)
                    
                    Text("all measurements needed for a suit, a vest, a shirt, or a chacabana should be input here..")
                        .font(.footnote)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous ))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .padding(10)
                //                .offset(y:100)
                
                    
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
                        
                        VStack{
                            ButtonView(title: "Save"){
                                withAnimation(.spring(response: 0.6,dampingFraction: 0.8)){
                                    show.toggle()
                                    print("button printed")
//                                    handleDismissal()
                                }
                            }
                            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                            .padding(20)
                            //                            .alert(isPresented: $displayPopupMessage){
                            //                                Alert(title: Text("Warning"),
                            //                                      message: Text("This is a test"),
                            //                                      dismissButton: .default(Text("OK"), action: {
                            //                                    print("Ok Click")
                            //                                    print("this is save button clicked")
                            //                                    //save data
                            //
                            //                                    //dismiss screen
                            ////                                    handleDismissal()
                            //                                })
                            //                                )
                            //                            }
                            
                            
                        }
                        
                    }
                    
                    
                    
               
                //                .offset(y:30)
                
                
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 900)
        .padding(20)
        .foregroundColor(.white)
        .mask (
            RoundedRectangle(cornerRadius: 30 ,
                             style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace)
            
        )
     
    }
}

struct MenTopsMeasuresView_Previews: PreviewProvider {
    @Namespace static var namespace
//    
    static var previews: some View {
        MenSuitsMeasuresView(namespace: namespace,show: .constant(true))
//        MenSuitsMeasuresView()
    }
}



extension MenSuitsMeasuresView {
    func handleDismissal(){
        if #available(iOS 15, *) {
            dismiss()
        }else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
