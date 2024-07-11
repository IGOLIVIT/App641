//
//  AddCollection.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI

struct AddCollection: View {

    @StateObject var viewModel: CollectionsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add a competition")
                        .foregroundColor(.white)
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
                        
                        Button(action: {
                            
                            viewModel.colls.append(viewModel.colTitle)
                            viewModel.colPhoto1 = viewModel.curPhoto1
                            viewModel.colPhoto2 = viewModel.curPhoto2
                        
                            viewModel.addCollection()
                            
                            viewModel.curPhoto1 = ""
                            viewModel.curPhoto2 = ""
                            viewModel.colPName1 = ""
                            viewModel.colPName2 = ""
                            
                            viewModel.fetchCollections()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color.green)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .opacity(viewModel.colTitle.isEmpty || viewModel.curPhoto1.isEmpty || viewModel.colPName1.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.colTitle.isEmpty || viewModel.curPhoto1.isEmpty || viewModel.colPName1.isEmpty ? true : false)
                    }
                }
                .padding(.vertical)
                .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Title")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.colTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.colTitle)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3").opacity(0.1)))
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curPhoto1 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curPhoto1.isEmpty {
                                    
                                    Image("eph")
                                        .frame(width: 120, height: 80)
                                        .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim2")))
                                    
                                } else {
                                    
                                    Image(viewModel.curPhoto1)
                                        .resizable()
                                        .frame(width: 120, height: 80)
                                        .cornerRadius(30)
                                }
                                
                            })
                            
                            VStack(spacing: 1) {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Title")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.colPName1.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.colPName1)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                             
                                Rectangle()
                                    .fill(.gray)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curPhoto2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curPhoto2.isEmpty {
                                    
                                    Image("eph")
                                        .frame(width: 120, height: 80)
                                        .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim2")))
                                    
                                } else {
                                    
                                    Image(viewModel.curPhoto2)
                                        .resizable()
                                        .frame(width: 120, height: 80)
                                        .cornerRadius(30)
                                }
                                
                            })
                            
                            VStack(spacing: 1) {
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Title")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.colPName2.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.colPName2)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                             
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
    AddCollection(viewModel: CollectionsViewModel())
}
