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
            req.allHTTPHeaderFields = request.dictionary
            req.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            let (data, res) = try await URLSession.shared.data(for: req)
            if (res as? HTTPURLResponse)?.statusCode == 204 {
                return nil
            }
            if let ContactSupportResponse = try? JSONDecoder().decode(ContactSupportResponse.self, from: data) {
                print(ContactSupportResponse)
                return ContactSupportResponse
            } else {
                print("Invalid Response")
                return nil
            }
        } catch {
            print("Failed to Send POST Request \(error)")
            return nil
        }
    }
}
