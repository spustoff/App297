//
//  CurrencyView.swift
//  App297
//
//  Created by IGOR on 27/12/2023.
//

import SwiftUI

struct CurrencyView: View {
    
    @StateObject var viewModel = IncomeViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                ZStack {
                    
                    Text("Currency pair")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            NavigationLink(destination: {
                                
                                GraphView()
                                    .navigationBarBackButtonHidden()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Image(index)
                                            
                                            Text(index)
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Text("+ $1.\(String(format: "%.f", Double(.random(in: 10000...90000))))")
                                        .foregroundColor(.green)
                                        .font(.system(size: 13, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(4)
                                        .background(Circle().fill(Color("or")))
                                }
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                            .onTapGesture {
                                
                                viewModel.currency = index
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
    CurrencyView()
}
