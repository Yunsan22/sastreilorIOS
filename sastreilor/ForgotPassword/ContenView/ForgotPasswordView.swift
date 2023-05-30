//
//  ForgotPasswordView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/29/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        //        Color.black
        
        NavigationView {
           
            VStack(spacing: 16){
                Section {
                    
                    InputTextFieldView(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    
                    
                    ButtonView(title: "Send Password Reset",background: .clear,
                               foreground: .blue,
                               border: .blue) {
                        //Handle password rese action
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .offset(y:-150)
                
            }
            .preferredColorScheme(.dark)
            .navigationTitle(NSLocalizedString("Reset Password", comment: ""))
            .background(
                
                    RoundedRectangle(cornerRadius: 30,style: .continuous).foregroundStyle(.linearGradient(colors: [.blue,.black], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 900,height: 400)
                        .rotationEffect(.degrees(135))
                        .offset(y:-365)
                    
                )
            .ApplyClose()
        }
        .preferredColorScheme(.dark)
        
        
        
        
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

