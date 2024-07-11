//
//  EntryView.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI

struct EntryView: View {
    
    @StateObject var viewModel = CollectionsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Add an entry")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                Text("You  have  added  \(Text("\(viewModel.numEntries)").foregroundColor(.red))  entries")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .bold))
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.photos, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curPhoto.isEmpty {
                                
                                Image("eph")
                                    .frame(width: 120, height: 90)
                                    .background(RoundedRectangle(cornerRadius: 30).stroke(.white))
                                
                            } else {
                                
                                Image(viewModel.curPhoto)
                                    .resizable()
                                    .frame(width: 120, height: 90)
                                    .cornerRadius(30)
                            }
                            
                        })
                        
                        Text("Category")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {

                                ForEach(viewModel.games, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currGame = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                            .foregroundColor(viewModel.currGame == index ? .white : Color("prim2"))
                                            .font(.system(size: 13, weight: .medium))
                                            .frame(height: 40)
                                            .padding(.horizontal)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2").opacity(viewModel.currGame == index ? 1 : 0)))
                                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2").opacity(viewModel.currGame == index ? 0 : 1)))
                                            .padding(1)
                                    })
                                }
                            }
                        }
                        .frame(height: 50)
                        
                        Text("Title")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 1) {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Label")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.enTitle.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.enTitle)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                         
                            Rectangle()
                                .fill(.gray)
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                        .padding(.bottom)
                        
                        Text("Collection")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        VStack(spacing: 15) {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.colls, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.curColl = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                HStack {
                                    
                                    if viewModel.curColl.isEmpty {
                                        
                                        
                                    } else {
                                        
                                        Text(viewModel.curColl)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.up.chevron.down")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(.trailing)
                                }
                            })
                         
                            Rectangle()
                                .fill(.gray)
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                        }
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.numEntries += 1
                            
                            viewModel.enPhoto = viewModel.curPhoto
                            viewModel.enCat = viewModel.currGame
                            viewModel.enColl = viewModel.curColl
                            
                            viewModel.addEntry()
                            
                            viewModel.curPhoto = ""
                            viewModel.currGame = ""
                            viewModel.curColl = ""
                            viewModel.enTitle = ""
                            
                            viewModel.fetchEntries()
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim2")))
                        })
                        .opacity(viewModel.currGame.isEmpty || viewModel.enTitle.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.currGame.isEmpty || viewModel.enTitle.isEmpty ? true : false)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    EntryView()
}
