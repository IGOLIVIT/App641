//
//  CollectionsView.swift
//  App641
//
//  Created by IGOR on 10/07/2024.
//

import SwiftUI

struct CollectionsView: View {
    
    @StateObject var viewModel = CollectionsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Collections")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGame = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "pencil")
                                .foregroundColor(Color("prim2"))
                                .font(.system(size: 16, weight: .regular))
                                .frame(width: 55, height: 40)
                                .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                                .padding(1)
                        })
                        
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
                            })
                        }
                    }
                }
                .frame(height: 50)
                .padding(.bottom)
                
                if viewModel.colls.isEmpty {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCollection = true
                        }
                        
                    }, label: {
                        
                        Text("+ Add a new collection")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(Color("prim2")))
                    })
                    
                    Spacer()
                    
                } else {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCollection = true
                        }
                        
                    }, label: {
                        
                        Text("+ Add a new collection")
                            .foregroundColor(Color("prim2"))
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 25).stroke(Color("prim2")))
                    })
                    .padding(.bottom)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.colls, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentCollDetail = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(spacing: 20) {
                                        
                                        HStack {
                                            
                                            Text(index)
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color("prim2"))
                                                .font(.system(size: 18, weight: .regular))
                                            
                                        }
                                            
                                        ForEach(viewModel.entries.filter{$0.enColl ?? "" == index && $0.enCat ?? "" == viewModel.currGame}, id: \.self) { ent in
                                        
                                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                                
                                                Image(ent.enPhoto ?? "")
                                                    .resizable()
                                                    .frame(height: 90)
                                                    .frame(maxWidth: .infinity)
                                                    .cornerRadius(30)
                                            })
                                        }
                                        
                                    }
                                    .padding(20)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                                })
                                
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddGame ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGame = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGame = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add a category")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.addGame.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addGame)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))

                    HStack {
                        
                        Button(action: {
                            
                            viewModel.games.append(viewModel.addGame)
                            
                            viewModel.addGame = ""
                   
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGame = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.green)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGame = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isAddGame ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAddCollection ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddCollection = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCollection = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Add a new collection")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.collForAdd.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.collForAdd)
                            .foregroundColor(Color.white)
                            .font(.system(size: 14, weight: .semibold))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))

                    HStack {
                        
                        Button(action: {
                            
                            viewModel.colls.append(viewModel.collForAdd)
                            
                            viewModel.collForAdd = ""
                   
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCollection = false
                                
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.green)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddCollection = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 40)
                            
                        })
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isAddCollection ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCollection(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchCollections()
        }
        .onAppear {
            
            viewModel.fetchEntries()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CollDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    CollectionsView()
}
