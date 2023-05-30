//
//  MensComponent.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/5/23.
//

import SwiftUI

struct MensComponent: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
//            Spacer()
            VStack{
//                Image("suit")
                Text("Tops")
                    .font(.largeTitle.weight(.bold))
                
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                    .matchedGeometryEffect(id: "title", in: namespace)
                Text("Men's tops measures".uppercased())
                    .font(.footnote.weight(.semibold))
                    .frame(maxWidth: .infinity,alignment: .bottomLeading)
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("All measurements needed for a suit, a vest, a shirt, or a chacabana should be input here..")
                    .font(.footnote)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            
            .padding(20)
//            .strokeStyle()
            .frame(height: 200)
            
            .background(
                Group{
                    
                    Image("suit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 130)
                        .offset(x:-25,y:-35)
        //                .matchedGeometryEffect(id: "background", in: namespace)
                    Image("Rectangle_112-removebg-preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 120)
                        .offset(x:130,y:-50)
        //                .matchedGeometryEffect(id: "background", in: namespace)
                    
                    Image("Rectangle_111-removebg-preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 110)
                        .offset(x:48,y:-45)
        //                .matchedGeometryEffect(id: "background", in: namespace)
    //                Rectangle()
    //                    .fill(.ultraThinMaterial)
    //                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous ))
    //                    .frame(maxWidth: 250, maxHeight: 30)
    //                    .blur(radius: 5)
    //                    .offset(x:40,y:20)
                    
                }
)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous ))
//                    .frame(maxWidth: .infinity, minHeight: 400)
                    .matchedGeometryEffect(id: "blur", in: namespace)
                    .shadow(color:Color("Shadow"),radius: 20,x:0,y:10)
            )
            
//            .overlay (
//
//            )
            
        }
        .foregroundColor(.white)
//        .background(
//            Image("suit")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .matchedGeometryEffect(id: "background", in: namespace))
//        .mask (
//            RoundedRectangle(cornerRadius: 15 ,
//                             style: .continuous)
//                .matchedGeometryEffect(id: "mask", in: namespace)
//        )
//        .frame(height: 600)
        .padding(20)
        .preferredColorScheme(.dark)
        
        
      
    }
}

struct MensComponent_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        MensComponent(namespace: namespace,show: .constant(true))
    }
}
