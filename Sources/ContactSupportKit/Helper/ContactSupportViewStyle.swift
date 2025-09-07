//
//  ContactSupportViewStyle.swift
//
//
//  Created by Maziar Saadatfar on 10/12/23.
//

import Foundation
import UIKit

public enum ContactSupportViewStyle {
    case style1
    case style2
    case style3
    case style4
    public static func make(viewModel: ContactSupportViewModel,
                            config: ContactSupportViewConfig) -> ContactSupportViewProtocol {
        switch config.style {
        case .style1:
            return ContactSupportView_Style1(viewModel: viewModel,
                                      config: config)
        case .style2:
            return ContactSupportView_Style2(viewModel: viewModel,
                                       config: config)
        case .style3:
            return ContactSupportView_Style3(viewModel: viewModel,
                                       config: config)
        case .style4:
            return ContactSupportView_Style4(viewModel: viewModel,
                                       config: config)
        }
    }
    
    public static func getViewConfigWithStyle(style: ContactSupportViewStyle, lang: String) -> ContactSupportViewConfig {
        switch style {
        case .style1:
            ContactSupportViewConfig_Style1(lang: lang)
        case .style2:
            ContactSupportViewConfig_Style2(lang: lang)
        case .style3:
            ContactSupportViewConfig_Style3(lang: lang)
        case .style4:
            ContactSupportViewConfig_Style4(lang: lang)
        }
    }
}
