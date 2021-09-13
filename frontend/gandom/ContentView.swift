//
//  ContentView.swift
//  gandom
//
//  Created by Hao Nguyen, Tuan Ho on 9/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var diceFaceRand = Int.random(in: 1...6)
        
    var body: some View {
        VStack {
            Spacer()
            Image(String(diceFaceRand))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150.0)
            Spacer()
            shakeButton
            Spacer()
        }
    }
    var shakeButton: some View {
        Button(action: {
            diceFaceRand = Int.random(in: 1...6)
        }, label: {
            Text("SHAKE")
                .font(.title)
                .foregroundColor(Color.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
        })
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
            .previewLayout(.device)
    }
}
