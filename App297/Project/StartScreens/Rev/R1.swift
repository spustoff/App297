//
//  R1.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack(spacing: 10) {
                
                Text("Control your day")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Take control of your day")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Primary")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    R1()
}
