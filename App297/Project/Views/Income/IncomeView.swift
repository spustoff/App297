//
//  IncomeView.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct IncomeView: View {
    
    @StateObject var viewModel = IncomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        CurrencyView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("\(viewModel.currency)")
                                .foregroundColor(Color("or"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                                .padding(7)
                                .background(Circle().fill(Color("or")))
                            
                        }
                    })
                }
                
                HStack {
                    
                    Text("Income")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddIncome(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding(7)
                            .background(Circle().fill(Color("or")))
                    })
                }
                
                if viewModel.incomes.isEmpty {
                    
                    VStack {
                        
                        Text("Add your first payout")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 10) {
                            
                            ForEach(viewModel.incomes, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.incomeName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text((index.incomeDate ?? Date()).convertDate(format: "MMM d HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))    
                                    }
                                    
                                    HStack {
                                        
                                        Text("\(index.incomeAmount)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchIncome()
        }
    }
}

#Preview {
    IncomeView()
}
