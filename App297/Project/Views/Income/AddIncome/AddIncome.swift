//
//  AddIncome.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct AddIncome: View {
    
    @StateObject var viewModel: IncomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ZStack {
                    
                    Text("New income")
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
                                    .font(.system(size: 14, weight: .medium))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("bg").ignoresSafeArea())
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.incomeName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.incomeName.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.incomeName)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 43)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(.horizontal)
                        
                        Text("Date")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        HStack {
                            
                            DatePicker("Departure", selection: $viewModel.incomeDate, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        Text("Amount")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .padding()
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Amount")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.incomeAmount.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.incomeAmount.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.incomeAmount)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 56)
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(.horizontal)
                        
                        Button(action: {
                            
                            viewModel.addIncome(completion: {
                                
                                viewModel.incomeName = ""
                                viewModel.incomeAmount = ""
                                
                                viewModel.fetchIncome()
                            })
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white.opacity(viewModel.incomeName.isEmpty || viewModel.incomeAmount.isEmpty ? 0.4 : 1))
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(viewModel.incomeName.isEmpty || viewModel.incomeAmount.isEmpty ? .black : Color("prim")))
                        })
                        .padding()
                        .padding(.top)
                        .disabled(viewModel.incomeName.isEmpty || viewModel.incomeAmount.isEmpty ? true : false)
                    }
                }
            }
        }
    }
}
#Preview {
    AddIncome(viewModel: IncomeViewModel())
}
