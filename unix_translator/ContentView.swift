//
//  ContentView.swift
//  unix_translator
//
//  Created by Pedro Almeida on 22/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MenuView(unixTime: "", formattedTime: "")
        }.frame(width: 320, height: 140)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
