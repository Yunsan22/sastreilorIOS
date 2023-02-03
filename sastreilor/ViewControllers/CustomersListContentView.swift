//
//  CustomersListContentView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/29/23.
//

import SwiftUI
import Firebase

struct CustomersListContentView: View {
    
    
    var body: some View {
        NavigationView {
            LazyVStack {
                
            }
            .padding(.horizontal)
            .navigationTitle("something")
        }
        
        
//        List (viewModel.custumerList){ item in
//            Text(item.name)
            
//        }
    }
    init() {
//        viewModel.getData()
    }
}

struct CustomersListContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomersListContentView()
    }
}
