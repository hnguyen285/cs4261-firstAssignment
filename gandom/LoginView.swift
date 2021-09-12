//
//  LoginView.swift
//  gandom
//
//  Created by Hao Nguyen on 9/12/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State var selection: Int? = nil
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField("Email", text: self.$email)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black)
                    ).padding()
                SecureField("Password", text: self.$password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black)
                    ).padding()
                Spacer()
                NavigationLink(
                    destination: Text("ContentView.swift"), tag: 1, selection: $selection
                ) {
                    Button(action: {
                        self.selection = 1
                    }, label: {
                        Text("Log In")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.green)
                            .cornerRadius(15.0)
                    })
                }
                
                Spacer()
                
            }
            
        }
        
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 12 Pro Max")
            .previewLayout(.device)
    }
}
