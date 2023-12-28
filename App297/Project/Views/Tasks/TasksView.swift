//
//  TasksView.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct TasksView: View {
    
    @StateObject var viewModel = TasksViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddTask(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding(7)
                            .background(Circle().fill(Color("or")))
                    })
                }
                
                Text("Tasks")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.tasks.isEmpty {
                    
                    VStack {
                        
                        Text("Start adding tasks for the day")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 10) {
                            
                            ForEach(viewModel.tasks, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text(index.taskName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                        Text((index.taskTime ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    
                                    Spacer()
                                    
                                    Text("#\(index.taskTag ?? "")")
                                        .foregroundColor(.green)
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(3)
                                        .padding(.horizontal, 3)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.green))
                                        .padding(2)
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
            
            viewModel.fetchTasks()
        }
    }
}

#Preview {
    TasksView()
}
