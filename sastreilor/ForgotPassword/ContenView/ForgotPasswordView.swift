//
//  ForgotPasswordView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/29/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.isPresented) var presentationMode
    
    var body: some View {
        //        Color.black
        
        NavigationView {
           
            VStack(spacing: 16){
               
                
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Reset Password")
            .background(
                
                    RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
                        .rotationEffect(.degrees(135))
                        .offset(y:-365).layoutPriority(-1)
                    
                )
            
        }
        
        
        
        
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}


