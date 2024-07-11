//
//  LoadingView.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 110)
            }
        }
    }
}

#Preview {
    LoadingView()
}
