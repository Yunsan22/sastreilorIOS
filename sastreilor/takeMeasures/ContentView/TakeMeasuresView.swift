//
//  TakeMeasuresView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/8/23.
//

import SwiftUI

struct TakeMeasuresView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
//            Spacer()
            VStack{
//                Image("suit")
                Image("measurement")
                    .resizable()
                    .frame(maxWidth: 30,maxHeight: 30)
                    .offset(x:-125,y:10)
                Text("Take")
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                Text("Measurements")
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .matchedGeometryEffect(id: "title2", in: namespace)

            }
            
            .padding(20)
//            .strokeStyle()
            .frame(height: 160)
            
            .background(
                Group{
                    
                    Image("suit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 160)
                        .offset(x:-25,y:0)
        //                .matchedGeometryEffect(id: "background", in: namespace)
                    Image("Rectangle_114-removebg-preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .offset(x:46,y: 3)
        //                .matchedGeometryEffect(id: "background", in: namespace)
  
                    Image("Rectangle_113-removebg-preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 170)
                        .offset(x:105,y:6)
        //                .matchedGeometryEffect(id: "background", in: namespace)
                    
                }
)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous ))
                    .matchedGeometryEffect(id: "blur", in: namespace)
                    .shadow(color:Color("Shadow"),radius: 20,x:0,y:10)
                    .preferredColorScheme(.dark)
            )
            
//            .overlay (
//
//            )
            
        }
        .foregroundColor(.white)

        .padding(20)
//        .background(
//            
//            ZStack{
//                RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
//                    .rotationEffect(.degrees(135))
//                    .offset(x:250,y:-300)
//                    .matchedGeometryEffect(id: "background", in: namespace)
//                
//            }
//                .preferredColorScheme(.dark))
        
        
      
    }
}

struct TakeMeasuresView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        TakeMeasuresView(namespace: namespace,show: .constant(true))
    }
}
