//
//  ContactSupporttable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol ContactSupportable: AnyObject {
    var contactSupportService: ContactSupportServiceProtocol { get set }
    func getContactSupport(request: ContactSupportRequest) async throws -> ContactSupportResponse?
}

extension ContactSupportable {
    public func getContactSupport(request: ContactSupportRequest) async throws -> ContactSupportResponse? {
        return try await contactSupportService.getContactSupport(request: request)
    }
}
