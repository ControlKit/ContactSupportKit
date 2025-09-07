//
//  ContactSupportResponse.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation

public typealias ContactSupportLocalString = [ContactSupportLocalizedText]

public struct ContactSupportResponse: Codable {
    public var data: [ContactSupportModel]?
}
public struct ContactSupportModel: Codable {
    public let id: String
    public let agreementTitle: ContactSupportLocalString?
    public let termsTitle: ContactSupportLocalString?
    public let termsDescription: ContactSupportLocalString?
    public let acceptButtonTitle: ContactSupportLocalString?
    public let declineButtonTitle: ContactSupportLocalString?
    public let version: String?
    public let created_at: String?
}
public struct ContactSupportLocalizedText: Codable {
    public let language: String?
    public let content: String?
}
