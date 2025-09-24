//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit

public protocol ContactSupportViewModel: ContactSupportable {
    var contactSupportService: ContactSupportServiceProtocol { get set }
    var serviceConfig: ContactSupportServiceConfig { get set }
    var response: ContactSupportResponse? { get set }
}

public final class DefaultContactSupportViewModel: ContactSupportViewModel {
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
