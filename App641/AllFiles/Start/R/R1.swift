//
//  R1.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Convenient functionality and ease of learning")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    HStack {
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.black)
                            .frame(width: 50, height: 4)
                        
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.black.opacity(0.3))
                            .frame(width: 50, height: 4)
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            
                            R2()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        })
                    }
                    .padding(.horizontal, 30)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 160)
            }
        }
    }
}

#Preview {
    R1()
}
