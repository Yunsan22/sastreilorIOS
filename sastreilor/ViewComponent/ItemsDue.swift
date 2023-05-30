//
//  ItemsDue.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 2/6/23.
//

import SwiftUI

struct ItemsDue: View {
    
    @Namespace var namespace
//    var customersJobs: CustomerJobs = customersJobs[0]
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 8.0) {
           Spacer()
            Text("Joe Doe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors:[.blue,.pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                .lineLimit(1)
            Text("Due by 02/25/2023".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
            Text("Items due are 2 Shirt, 1 pair of pants..")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all,20.0)
        .padding(.vertical,20.0)
        .frame(height: 200.0)
        .background(.ultraThinMaterial
        )
        .mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
        .strokeStyle()
        .padding(.horizontal,20)
     
    }
}

struct ItemsDue_Previews: PreviewProvider {
    static var previews: some View {
        ItemsDue()
    }
}
