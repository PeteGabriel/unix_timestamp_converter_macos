//
//  MenuView.swift
//  unix_translator
//
//  Created by Pedro Almeida on 22/11/22.
//

import SwiftUI

struct MenuView: View {
    //slide animation
    @Namespace var slideAnimation
    
    //current tab at all times
    @State var currentTab = "Unix Converter"
    
    //unix time given to convert
    @State var unixTime: String
    
    var body: some View {
        VStack {
            Text("Unix timestamp converter")
                .bold()
                .font(.headline)
            
            VStack {
                UnixTimeTextField(unixTime: $unixTime)
                ConvertTimeButton(title: "Convert", currentTab: $currentTab)
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            Spacer(minLength: 0)
        }
        .frame(width: 250, height: 200)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        let currentUnixTime = String(format:"%.0f", Date.now.timeIntervalSince1970)
        MenuView(unixTime: currentUnixTime)
    }
}


struct UnixTimeTextField: View {
    @Binding var unixTime: String
    
    var body: some View {
        TextField("Unix time", text: $unixTime)
            .frame(width: 99, alignment: .trailing)
            .disableAutocorrection(true)
            
    }
}


struct ConvertTimeButton: View {
    var title: String
    @Binding var currentTab: String
    
    var body: some View {
        Button(action: {}, label: {
            Text(title)
                .font(.callout)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .padding(.vertical, 4)
                .frame(width: 90).background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(.blue)
                    }
                )
        })
    }
}
