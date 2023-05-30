//
//  ProfileView.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/5/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                VStack {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .symbolVariant(.circle.fill)
                        .font(.system(size: 32))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue,.blue.opacity(0.3))
                        .padding()
                        .background(Circle().fill(.ultraThinMaterial))
                        .background(Image(systemName: "hexagon")
                            .symbolVariant(.fill)
                            .foregroundColor(.blue)
                            .font(.system(size: 200))
                        .offset(x: -50,y: -100)
                        )
                    Text("Yunior Sanchez")
                        .font(.title.weight(.semibold))
                    HStack {
                        Image(systemName: "location")
                            .imageScale(.small)
                        Text("USA")
                            .foregroundColor(.secondary)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                        
                
                Section {
                    Label("Settings",systemImage: "gear")
                    Label("Billing",systemImage: "creditcard")
                    Label("Help",systemImage: "questionmark")
                }
                .listRowSeparatorTint(.blue)
                .listRowSeparator(.hidden)
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
