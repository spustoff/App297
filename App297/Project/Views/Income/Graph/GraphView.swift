//
//  GraphView.swift
//  App297
//
//  Created by IGOR on 27/12/2023.
//

import SwiftUI

struct GraphView: View {

    @StateObject var viewModel = IncomeViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                ZStack {
                    
                    Text("\(viewModel.currency)")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                        
                    }
                }
                .padding(.bottom)
                
                Text("Currency value")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 40...60)))).\(String(format: "%.f", Double(.random(in: 10...80))))")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text("+ \(String(format: "%.f", Double(.random(in: 20...60)))).\(String(format: "%.f", Double(.random(in: 10...80))))")
                        .foregroundColor(.green)
                        .font(.system(size: 12, weight: .semibold))
                 
                    Spacer()
                }
                
                Image("graph2")
                    .resizable()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.green))
                    })
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    GraphView()
}
