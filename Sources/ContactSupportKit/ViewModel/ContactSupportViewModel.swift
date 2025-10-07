//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 9/29/23.
//
import Foundation
import UIKit
import ControlKitBase

public protocol ContactSupportViewModel: ContactSupportable {
    var contactSupportService: GenericServiceProtocol { get set }
    var serviceConfig: ContactSupportServiceConfig { get set }
    var response: ContactSupportResponse? { get set }
}

public final class DefaultContactSupportViewModel: ContactSupportViewModel {
    public var contactSupportService: GenericServiceProtocol
    public var serviceConfig: ContactSupportServiceConfig
    public var response: ContactSupportResponse?
    
    public init(serviceConfig: ContactSupportServiceConfig,
                contactSupportService: GenericServiceProtocol = GenericService()
    ) {
        self.contactSupportService = contactSupportService
        self.serviceConfig = serviceConfig
    }
}
