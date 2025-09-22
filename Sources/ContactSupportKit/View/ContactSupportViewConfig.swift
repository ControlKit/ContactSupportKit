//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class ContactSupportViewConfig {
    public init(lang: String) {
        self.lang = lang
    }
    
    public let lang: String
    public var style: ContactSupportViewStyle = .style1
    public var contentViewBackColor: UIColor = UIColor(r: 25, g: 29, b: 32, a: 1.0)
    public var containerViewBackColor: UIColor = UIColor(r: 25, g: 29, b: 32, a: 1.0)
    
    public var titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
    public var titleText = "ContactSupport"
    public var titleColor: UIColor = UIColor(r: 30, g: 30, b: 30)
    
    public var subjectLabelFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    public var subjectText = "Subject"
    public var subjectTextColor: UIColor = UIColor(r: 84, g: 84, b: 84)
    
    public var emailLabelFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    public var emailText = "E-mail Address"
    public var emailTextColor: UIColor = UIColor(r: 84, g: 84, b: 84)
    
    public var messageLabelFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    public var messageText = "Message"
    public var messageTextColor: UIColor = UIColor(r: 84, g: 84, b: 84)
    
    public var subjectTextFiledFont = UIFont.systemFont(ofSize: 18, weight: .regular)
    public var subjectTextFieldPlaceHolder = "Please insert the subject"
    public var subjectTextFieldPlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
    public var subjectTextFieldBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198)
    public var subjectTextFieldBorderWidth: CGFloat = 1.0
    public var subjectTextFieldRadius: CGFloat = 20.0
    public var subjectTextFieldTextColor: UIColor = .black
    public var subjectTextFieldBackColor: UIColor = .clear
    
    public var emailTextFiledFont = UIFont.systemFont(ofSize: 18, weight: .regular)
    public var emailTextFieldPlaceHolder = "Please insert the email"
    public var emailTextFieldPlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
    public var emailTextFieldBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198)
    public var emailTextFieldBorderWidth: CGFloat = 1.0
    public var emailTextFieldRadius: CGFloat = 20.0
    public var emailTextFieldTextColor: UIColor = .black
    public var emailTextFieldBackColor: UIColor = .clear
    
    
    public var messagePlaceHolder = "Please insert your message in less than 600 character"
    public var messagePlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
    public var messagePlaceHolderFont = UIFont.systemFont(ofSize: 18, weight: .regular)
    
    public var messageTextFiledFont = UIFont.systemFont(ofSize: 18, weight: .regular)
    public var messageTextFieldBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198)
    public var messageTextFieldBorderWidth: CGFloat = 1.0
    public var messageTextFieldRadius: CGFloat = 20.0
    public var messageTextFieldTextColor: UIColor = .black
    public var messageTextFieldBackColor: UIColor = .clear
    
    public var sendButtonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
    public var sendButtonTitle = "Send"
    public var sendButtonTitleColor: UIColor = .black
    public var sendButtonBackColor: UIColor = UIColor(r: 163, g: 163, b: 163)
    public var sendButtonRadius: CGFloat = 20.0
    public var sendButtonBorderWidth: CGFloat = 1
    public var sendButtonBorderColor: UIColor = .clear
    
    public var cancelButtonFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
    public var cancelButtonTitle = "Cancel"
    public var cancelButtonTitleColor: UIColor = UIColor(r: 163, g: 163, b: 163)
    public var cancelButtonBorderColor: UIColor = UIColor(r: 163, g: 163, b: 163)
    public var cancelButtonBackColor: UIColor = .clear
    public var cancelButtonBorderWidth: CGFloat = 1.0
    public var cancelButtonRadius: CGFloat = 20.0
}
