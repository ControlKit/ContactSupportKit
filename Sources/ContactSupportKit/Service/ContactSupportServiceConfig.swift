//
//  ContactSupportServiceConfig.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
public struct ContactSupportServiceConfig {
    public init(style: ContactSupportViewStyle = .style1,
                appId: String,
                version: String) {
        self.viewConfig = ContactSupportViewStyle.getViewConfigWithStyle(style: style)
        self.appId = appId
        self.version = version
    }
    public var appId: String
    public var version: String = "1"
    public var sdkVersion: String = contactSupportKit_Version
    public var viewConfig: ContactSupportViewConfig
}
