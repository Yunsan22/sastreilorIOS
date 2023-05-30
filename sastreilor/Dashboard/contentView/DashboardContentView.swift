//
//  DashboardContentView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/6/23.
//

import SwiftUI

struct DashboardContentView: View {
    @StateObject private var viewModel = SuitMeasuresDataCreationViewModelImpl(
        service: MeasuresServiceImpl()
    )
    
    
    @State var hasScrolled =  false
    @Namespace var namespace
    @State var show = false
    
    @State private var displayPopupMessage: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var showStatusBar = true
    
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView {
                scrollDetection
               
                itemsDue
                
                Text("Dashboard".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.horizontal,20)
                
                if !show {
                    TakeMeasuresView(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6,dampingFraction: 0.8) ) {
                                
                                show.toggle()
                                showStatusBar = false
                            }
                            
                        }
                }
               
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Items Due", hasSCrolled: $hasScrolled)
                
        )
            if show {
            
                CustomerDetailsContentView(namespace: namespace, shouldShowDashboard: $show)
//                CustomerDetailsContentView()

            }
        }
        .statusBarHidden()
//        .onChange(of: show) { newValue in
//            withAnimation(.spring(response: 0.6,dampingFraction: 0.8) ) {
//                if newValue {
//                    showStatusBar = false
//                } else {
//                    showStatusBar = true
//                }
//            }
//
//        }
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
    var itemsDue: some View {
        TabView {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                GeometryReader { proxy in
                    
                    let minX = proxy.frame(in: .global).minX
                    
                    ItemsDue()
                        .padding(.vertical,10)
                        .rotation3DEffect(.degrees(minX / -5 ), axis: (x: 0, y: 1, z: 0) )
                        .shadow(color: Color("Shadow"), radius: 10,x:0,y:10)
                        .blur(radius: abs(minX / 40 ))
                        .overlay(
                            Group{
                                
                                Image("Rectangle_112-removebg-preview")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 120)
                                    .offset(x:60,y:-38)
                                    .offset(x:minX)
                    //                .matchedGeometryEffect(id: "background", in: namespace)
                                
                                Image("Rectangle_111-removebg-preview")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 120)
                                    .offset(x:140,y:-40)
                                    .offset(x:minX)
                    //                .matchedGeometryEffect(id: "background", in: namespace)
                          
                            }
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 230)
        .background(
            RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
                .rotationEffect(.degrees(135))
                .offset(x:-100,y:-200)
//                .matchedGeometryEffect(id: "background", in: namespace)
        )
    }
}

struct DashboardContentView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        DashboardContentView()
    }
}

extension DashboardContentView {
    func handleDismissal(){
        if #available(iOS 15, *) {
            dismiss()
        }else {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
