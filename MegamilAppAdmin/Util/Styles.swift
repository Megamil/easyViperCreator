//
//  Styles.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 02/09/21.
//

import SwiftUI

struct MegamilButton: ButtonStyle {
    
    var isActive: Bool = true
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(width: 300, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(isActive ? Color(#colorLiteral(red: 1, green: 0.4509803922, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)))
            .cornerRadius(3.0)
            .foregroundColor(.white)
            .font(.title)
        
    }
    
}
