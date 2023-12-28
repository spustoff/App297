//
//  SettingsView.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("1")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .padding(3)
                                .background(Circle().fill(Color("or")))
                            
                        }
                    })
                }
                .opacity(0)
                .disabled(true)
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                    
                    Spacer()
   
                }
                .padding(.bottom)
                                    
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Rate app")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("or"))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1pZGGSa67EXnx3lnPCsd_E1w_drpDVCscWtYPaUM6Iz8/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Usage policy")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("or"))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                })
                                    
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
