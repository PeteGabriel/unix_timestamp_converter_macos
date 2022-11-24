//
//  MenuView.swift
//  unix_translator
//
//  Created by Pedro Almeida on 22/11/22.
//

import SwiftUI

let UnixTimeText = "Unix timestamp"
let FormattedTimeText = "Formatted time"
let TitleText = "Unix timestamp converter"

struct MenuView: View {
    //slide animation
    @Namespace var slideAnimation
    
    //unix time given to convert
    @State var unixTime: String
    @State var formattedTime: String
    
    var body: some View {
        VStack {
            Text(TitleText)
                .bold()
                .font(.headline)
            
            VStack {
                HStack(alignment: .center, spacing: 4.0) {
                    VStack(alignment: .leading) {
                        Text(UnixTimeText)
                            .frame(alignment: .bottom)
                            .fontDesign(.serif)
                            .font(.callout)
                            .italic(true)
                        
                        UnixTimeTextField(unixTime: $unixTime)
                    }
                    .frame(width: 150, height: 50)
                    
                    
                    VStack(alignment: .leading){
                        Text(FormattedTimeText)
                            .fontDesign(.serif)
                            .font(.callout)
                            .italic(true)
                        Spacer()
                        Text(formattedTime).frame(width: 150)
                    }
                    .frame(width: 150, height: 43)

                }
                ConvertTimeButton(unixTime: $unixTime, formattedTime: $formattedTime)
            }
            .padding(.top)
            .frame(width: 300)
            
        }
        .frame(width: 320, height: 140)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        
        //apply default values
        let currentUnixTime = ""
        let currentFormatedTime = ""
        
        MenuView(unixTime: currentUnixTime, formattedTime: currentFormatedTime)
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
    @Binding var unixTime: String
    @Binding var formattedTime: String
    
    var body: some View {
        Button(action: {
            //convert time and change state
            let time = Double(unixTime) ?? 0
            formattedTime = Date(timeIntervalSince1970: time).formatted(.iso8601)
        }, label: {
            Text("Convert")
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
        }).buttonStyle(PlainButtonStyle())
    }
}
