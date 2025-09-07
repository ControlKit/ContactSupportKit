//
//  ContactSupportPresenter.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 8/26/25.
//
import Foundation
import UIKit
public struct ContactSupportViewPresenter {
    var config: ContactSupportViewConfig
    public init(data: ContactSupportModel?, config: ContactSupportViewConfig) {
        self.config = config
        if let localTitle = data?.title,
            let title = getLocalizeString(localTitle) {
            self.config.ContactSupport = title
        }
        if let localDescription = data?.termsDescription,
           let description = getLocalizeString(localDescription) {
            self.config.termsDescription = description
        }
        if let localTerms = data?.terms,
           let terms = getLocalizeString(localTerms) {
            self.config.terms = terms
        }
        if let loaclAccept = data?.acceptButtonTitle,
           let acceptButtonTitle = getLocalizeString(loaclAccept) {
            self.config.acceptButtonTitle = acceptButtonTitle
        }
        if let loaclDecline = data?.declineButtonTitle,
           let declineButtonTitle = getLocalizeString(loaclDecline) {
            self.config.declineButtonTitle = declineButtonTitle
        }
    }
    
    func getLocalizeString(_ localize: ContactSupportLocalString) -> String? {
        guard let localizeString = localize.first(where: { $0.language == config.lang }) else {
            if let defaultLang = localize.first(where: { $0.language == "en" }) {
                return defaultLang.content
            } else {
                return nil
            }
        }
        return localizeString.content
    }
}

extension String {
    func formatDate() -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm"
       let dateObj: Date? = dateFormatterGet.date(from: self)

       return dateFormatter.string(from: dateObj!)
    }
    func formatDate2() -> String {
       let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "yyyy-MMM-dd"
       let dateObj: Date? = dateFormatterGet.date(from: self)

       return dateFormatter.string(from: dateObj!)
    }
}
