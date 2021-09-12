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
    @State var isLoggedIn = false
    
    var body: some View {
        if self.isLoggedIn {
            ContentView()
        } else {
        
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
                            self.getLogin()
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
    
    
    
    func getLogin() {
        var default_url = "http://127.0.0.1:5000/api/login"
        guard let url = URL(string: default_url) else { fatalError("Missing URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "username=" + self.email + "&" + "password=" + self.password;
        request.httpBody = postString.data(using: String.Encoding.utf8)
        print(request)
        
        struct UploadData: Codable {
            let username: String
            let password: String
        }
        let uploadDataModel = UploadData(username: self.email, password: self.password)

        
        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        request.httpBody = jsonData

        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    let success = "loggedIn"
                    if dataString.contains(success) {
                        self.isLoggedIn = true
                    }
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 12 Pro Max")
            .previewLayout(.device)
    }
}
