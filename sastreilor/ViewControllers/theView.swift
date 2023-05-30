//
//  theView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/4/23.
//

import SwiftUI

struct theView: View {
    @StateObject private var viewModel = SuitMeasuresDataCreationViewModelImpl(
        service: MeasuresServiceImpl()
    )
    
    @State var hasScrolled =  false
    @Namespace var namespace
    @State var show = false
//    var namespace: Namespace.ID
//    @Binding var show: Bool
    @State private var displayPopupMessage: Bool = false
    
    @State var showPreviousView = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var showStatusBar = true
    
    
    
    var body: some View {
        //        preferredColorScheme(.dark)
   
            ZStack {
                ScrollView {
                    scrollDetection
                    
                    if !show {
                        MensComponent(namespace: namespace, show: $show)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6,dampingFraction: 0.8) ) {
                                    show.toggle()
                                    showStatusBar = false
                                }
                                
                            }
                    }
                    
                }
                .preferredColorScheme(.dark)
                .coordinateSpace(name: "scroll")
                .safeAreaInset(edge: .top, content: {
                    Color.clear.frame(height: 70)
                })
                .ignoresSafeArea()
                .overlay(
                    Group{
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
                        .offset(y:15
                        )
                        .alert(isPresented: $displayPopupMessage){
                            Alert(title: Text("Warning"),
                                  message: Text("Are you sure you want to go back and lose your progress"),
                                  dismissButton: .default(Text("OK"), action: {
                                show.toggle()
                                print("Dis is customer details")
                                print("thisclicked")
                                handleDismissal()
                            })
                            )
                        }
                        .ignoresSafeArea()
                        
                        Button {
                            withAnimation(.spring(response: 0.6,dampingFraction: 0.8)) {
                                displayPopupMessage.toggle()
                            }
                        } label: {
                            Text( "Done")
                                .font(.body.weight(.bold))
                                .foregroundColor(.secondary)
                                .padding(15)
                                .background(.ultraThinMaterial, in: Circle())
                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                        .padding(20)
                        .offset(y:10
                        )
                        
                        .alert(isPresented: $displayPopupMessage){
                            Alert(title: Text("Warning"),
                                  message: Text("All data will be deleted"),
                                  dismissButton: .default(Text("OK"), action: {
                                show.toggle()
                                print("Dis is customer details")
                                print("thisclicked")
                                handleDismissal()
                            })
                            )
                        }
                        .ignoresSafeArea()
                    }
                    
                   
                )
                
                
                if show {
                    MenSuitsMeasuresView(namespace: namespace, show: $show)
//                    MenSuitsMeasuresView()
                }
                
            }
            //        .overlay(
            //            NavigationBar(title: "Measures" )
            //        )
            .preferredColorScheme(.dark)
            .navigationTitle("Measures")
            .background(
                ZStack{
                    Color.black
                    RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 1200,height: 450)
                        .rotationEffect(.degrees(135))
                        .offset(y:-400)
                    
                })
            .statusBarHidden(!showStatusBar)
            .onChange(of: show) { newValue in
                withAnimation(.spring(response: 0.6,dampingFraction: 0.8) ) {
                    if newValue {
                        showStatusBar = false
                    } else {
                        showStatusBar = true
                    }
                }
    
            }
            
    }
    var scrollDetection: some View {
        GeometryReader { proxy in
//                Text("\(proxy.frame(in: .named("scroll")).minY)")
            Color.clear.preference(key: ScrollPreferenceKey.self,value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self,perform: { value in
            withAnimation(.easeInOut){
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
        
    }
}

struct theView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        
        theView()
//        theView(namespace: namespace, show: .constant(true))
    }
}

extension theView {
    func handleDismissal(){
        if #available(iOS 15, *) {
            dismiss()
        }else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
