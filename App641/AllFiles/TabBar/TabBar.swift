//
//  TabBar.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim2") : Color("prim2").opacity(0.5))
                            .frame(width: 15, height: 15)

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 48)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2)))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Entry = "Entry"
    
    case Collections = "Collections"
    
    case Settings = "Settings"
    
}
