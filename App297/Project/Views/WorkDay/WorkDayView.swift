//
//  WorkDayView.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct WorkDayView: View {
    
    @StateObject var viewModel = WorkDayViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("vbg")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .overlay (
                        
                        ZStack {
                            
                            VStack(alignment: .trailing) {
                                
                                DatePicker("Departure", selection: $viewModel.nowDate, in: Date()..., displayedComponents: .date)
                                    .labelsHidden()
                                    .padding(2)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.4)))
                                    .padding(.horizontal)
                                    .disabled(true)
                                
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Work Day")
                                    .foregroundColor(.black)
                                    .font(.system(size: 26, weight: .bold))
                                    .padding(.bottom, 150)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack {
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Text("Notes")
                                        .foregroundColor(.black)
                                        .font(.system(size: 24, weight: .regular))
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: {
                                        
                                        AddNote(viewModel: viewModel)
                                            .navigationBarBackButtonHidden()
                                        
                                    }, label: {
                                        
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                            .padding(7)
                                            .background(Circle().fill(Color("or")))
                                    })
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 40)
                            }
                        }
                    )
                
                if viewModel.notes.isEmpty {
                    
                    VStack {
                        
                        Text("Add things to do for the day")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 10) {
                            
                            ForEach(viewModel.notes, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    HStack {
                                        
                                        Text((index.notDate ?? Date()).convertDate(format: "MMMM d"))
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Text((index.notWF ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Text("-")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                        
                                        Text((index.notWT ?? Date()).convertDate(format: "HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                    }
                                    
                                    Text(index.notName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .bold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear{
            
            viewModel.fetchNotes()
        }
    }
}

#Preview {
    WorkDayView()
}
