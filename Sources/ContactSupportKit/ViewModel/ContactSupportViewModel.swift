//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol ContactSupportViewModel {
    var contactSupportService: ContactSupportServiceProtocol { get set }
    var serviceConfig: ContactSupportServiceConfig { get set }
    var response: ContactSupportResponse? { get set }
}

public final class DefaultContactSupportViewModel: ContactSupportViewModel, ContactSupportable {
    public var contactSupportService: ContactSupportServiceProtocol
    public var serviceConfig: ContactSupportServiceConfig
    public var response: ContactSupportResponse?
    
    public init(serviceConfig: ContactSupportServiceConfig,
                contactSupportService: ContactSupportServiceProtocol = ContactSupportService()
    ) {
        self.contactSupportService = contactSupportService
        self.serviceConfig = serviceConfig
    }
}
