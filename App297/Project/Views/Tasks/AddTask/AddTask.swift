//
//  AddTask.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct AddTask: View {
    
    @StateObject var viewModel: TasksViewModel
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
                                    .foregroundColor(viewModel.taskName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.taskName.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.taskName)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 43)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(.horizontal)
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                                .padding()
                            
                            DatePicker("Time", selection: $viewModel.taskTime, in: Date()..., displayedComponents: .hourAndMinute)
                                .labelsHidden()
                                .environment(\.locale, Locale(identifier: "en_US"))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Tag")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("#Enter")
                                    .foregroundColor(viewModel.taskTag.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.taskTag.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.taskTag)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 33)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(.bottom)
                        .padding(.horizontal)
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Description")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.taskDescription.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.taskDescription.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.taskDescription)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 80)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(.bottom)
                        .padding(.horizontal)
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Notes")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.taskNotes.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.taskNotes.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.taskNotes)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 43)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg")))
                        .padding(.bottom)
                        .padding(.horizontal)
                        
                        Button(action: {
                            
                            viewModel.addTask(completion: {
                                
                                viewModel.taskName = ""
                                viewModel.taskTag = ""
                                viewModel.taskDescription = ""
                                viewModel.taskNotes = ""
                            })
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Create")
                                .foregroundColor(.white.opacity(viewModel.taskName.isEmpty || viewModel.taskTag.isEmpty || viewModel.taskDescription.isEmpty || viewModel.taskNotes.isEmpty ? 0.4 : 1))
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(viewModel.taskName.isEmpty || viewModel.taskTag.isEmpty || viewModel.taskDescription.isEmpty || viewModel.taskNotes.isEmpty ? .black : Color("prim")))
                        })
                        .padding()
                        .padding(.top)
                        .disabled(viewModel.taskName.isEmpty || viewModel.taskTag.isEmpty || viewModel.taskDescription.isEmpty || viewModel.taskNotes.isEmpty ? true : false)
                    }
                }
            }
        }
    }
}

#Preview {
    AddTask(viewModel: TasksViewModel())
}
