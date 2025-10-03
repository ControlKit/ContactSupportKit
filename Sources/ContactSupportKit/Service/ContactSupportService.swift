//
//  ContactSupportServiceProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public protocol ContactSupportServiceProtocol {
    func getContactSupport(request: ContactSupportRequest) async throws -> ContactSupportResponse?
}

public class ContactSupportService: ContactSupportServiceProtocol {
    public init() {}
    public func getContactSupport(request: ContactSupportRequest) async throws -> ContactSupportResponse? {
        do {
            guard let url = URL(string: request.route) else {
                return ContactSupportResponse()
            }
            var req = URLRequest(url: url)
            req.allHTTPHeaderFields = request.headers
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            req.httpMethod = "POST"
            req.httpBody = try JSONEncoder().encode(request.params)
            
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                print("Contact Support Response --> 204")
                return nil
            }
            if let response = try? JSONDecoder().decode(ContactSupportResponse.self, from: data) {
                print("Contact Support Response --> 200")
                print(response)
                return response
            } else {
                print("Contact Support Response --> Decode Error")
                return nil
            }
        } catch {
            print("Failed to Send POST Contact Support Request \(error)")
            return nil
        }
    }
}
