//
//  Network.swift
//  gandom
//
//  Created by Tuan Ho on 9/12/21.
//

import SwiftUI


class Network: ObservableObject {
    @Published var users: [User] = []
    
    var default_url = "http://127.0.0.1:5000/api/login"
    
    func getLogin(username: String, password: String) {
        guard let url = URL(string: default_url) else { fatalError("Missing URL") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "username=" + username + "&" + "password=" + password;
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
}
