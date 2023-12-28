//
//  Join.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL

    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            Image("Join")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                Text("Join and earn")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Join our Telegram group trade with our team")
                    .foregroundColor(.black.opacity(0.6))
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                })
                .padding()
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
