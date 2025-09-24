//
//  ContactSupporttable.swift
//
//
//  Created by Maziar Saadatfar on 10/11/23.
//

import Foundation

public protocol ContactSupportable: AnyObject {
    var contactSupportService: ContactSupportServiceProtocol { get set }
    func sendContactSupport(viewRequest: ContactSupportViewRequest) async throws -> ContactSupportResponse?
}

extension ContactSupportable where Self: ContactSupportViewModel {
    public func sendContactSupport(viewRequest: ContactSupportViewRequest) async throws -> ContactSupportResponse? {
        let request = ContactSupportRequest(
            appId: serviceConfig.appId,
            viewReq: viewRequest
        )
        return try await contactSupportService.getContactSupport(request: request)
    }
}
