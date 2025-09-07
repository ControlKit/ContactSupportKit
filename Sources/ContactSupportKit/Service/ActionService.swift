//
//  ContactSupportServiceProtocol.swift
//  
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public protocol ActionServiceProtocol {
    func action(request: ActionRequest) async throws -> ActionResponse?
}
public class ActionService: ActionServiceProtocol {
    public init() {}
    public func action(request: ActionRequest) async throws -> ActionResponse? {
        do {
            guard let url = URL(string: request.route) else {
                return ActionResponse()
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
            if let ContactSupportResponse = try? JSONDecoder().decode(ActionResponse.self, from: data) {
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
