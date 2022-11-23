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
    @State var formatedTime: String
    
    var body: some View {
        VStack {
            Text("Unix timestamp converter")
                .bold()
                .font(.headline)
            
            VStack {
                HStack(alignment: .center, spacing: 10.0) {
                    VStack(alignment: .leading) {
                        Text("Unix timestamp")
                            .frame(alignment: .bottom)
                            .fontDesign(.serif)
                            .font(.callout)
                            .italic(true)
                        
                        UnixTimeTextField(unixTime: $unixTime)
                    }
                    .frame(maxHeight: 50)
                    
                    
                    VStack(alignment: .leading){
                        Text("Formatted time")
                            .fontDesign(.serif)
                            .font(.callout)
                            .italic(true)
                        Spacer()
                        Text(formatedTime)
                    }
                    .frame(maxHeight: 43)

                }
                .frame(width: .infinity)
                ConvertTimeButton(title: "Convert", currentTab: $currentTab)
            }
            .padding(.top)
            .frame(width: .infinity)
            
        }
        .frame(width: 320, height: 140)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        
        let currentUnixTime = String(format:"%.0f", Date.now.timeIntervalSince1970)
        let currentFormatedTime = Date.now.formatted(.iso8601)
        
        MenuView(unixTime: currentUnixTime, formatedTime: currentFormatedTime)
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
