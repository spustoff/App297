//
//  ConvertDate.swift
//  App297
//
//  Created by IGOR on 25/12/2023.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        return formatter.string(from: date)
    }
}
