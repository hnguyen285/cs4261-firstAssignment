//
//  ContentView.swift
//  gandom
//
//  Created by Hao Nguyen, Tuan Ho on 9/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var diceFaceRand = Int.random(in: 2...7)
        
    var body: some View {
        VStack {
            Spacer()
            Image(String(diceFaceRand))
                .aspectRatio(contentMode: .fit)
            Spacer()
            Button(action: {
                diceFaceRand = Int.random(in: 2...7)
            }, label: {
                Text("SHAKE")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.black).padding(5.0)
            })
            .padding(3.0)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/4/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
