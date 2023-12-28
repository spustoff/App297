//
//  AddNote.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct AddNote: View {
    
    @StateObject var viewModel: WorkDayViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ZStack {
                    
                    Text("New notes")
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
                                    .foregroundColor(viewModel.notName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.notName.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.notName)
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
                            
                            DatePicker("Departure", selection: $viewModel.notDate, in: Date()..., displayedComponents: .date)
                                .labelsHidden()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        Text("Work schedule")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .padding()
                        
                        HStack {
                            
                            DatePicker("Time", selection: $viewModel.notWF, in: Date()..., displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .environment(\.locale, Locale(identifier: "en_US"))
                            
                            DatePicker("Time", selection: $viewModel.notWT, in: Date()..., displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .environment(\.locale, Locale(identifier: "en_US"))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        Button(action: {
                            
                            viewModel.addNote(completion: {
                                
                                viewModel.notName = ""
                                
                                viewModel.fetchNotes()
                            })
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white.opacity(viewModel.notName.isEmpty ? 0.4 : 1))
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(viewModel.notName.isEmpty ? .black : Color("prim")))
                        })
                        .padding()
                        .padding(.top)
                        .disabled(viewModel.notName.isEmpty ? true : false)
                    }
                }
            }
        }
    }
}

#Preview {
    AddNote(viewModel: WorkDayViewModel())
}
