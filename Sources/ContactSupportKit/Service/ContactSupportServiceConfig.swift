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
                language: String,
                version: String) {
        self.viewConfig = ContactSupportViewStyle.getViewConfigWithStyle(style: style, lang: language)
        self.appId = appId
        self.version = version
    }
    public var route: String = "https://tauri.ir/api/ContactSupport-view"
    public var appId: String = "9fb42682-ebd0-4553-a131-2620ca7f2f63" //Bundle.main.bundleIdentifier ?? String()
    public var version: String = "1" //Bundle.main.releaseVersionNumber ?? String()
    public var sdkVersion: String = "1.0.0"
    public var viewConfig: ContactSupportViewConfig
}
