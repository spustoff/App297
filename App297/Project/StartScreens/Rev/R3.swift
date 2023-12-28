//
//  R3.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack(spacing: 10) {
                
                Text("Payroll control system")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Payroll control right from home")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                Button(action: {
        
                    status = true
                    
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
    R3()
}
