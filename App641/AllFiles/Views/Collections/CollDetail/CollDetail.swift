//
//  CollDetail.swift
//  App641
//
//  Created by IGOR on 11/07/2024.
//

import SwiftUI

struct CollDetail: View {
    
    @StateObject var viewModel: CollectionsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.currentCollDetail)
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.entries.filter{$0.enColl ?? "" == viewModel.currentCollDetail}, id: \.self) { index in
                        
                        HStack {
                            
                            Image(index.enPhoto ?? "")
                                .resizable()
                                .frame(width: 120, height: 80)
                                .cornerRadius(30)
                            
                            
                            VStack(spacing: 1) {
                                
                                Text(index.enTitle ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                
                                Rectangle()
                                    .fill(.gray)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CollDetail(viewModel: CollectionsViewModel())
}
