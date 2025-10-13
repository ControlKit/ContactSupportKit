//
//  File.swift
//  
//
//  Created by Maziar Saadatfar on 10/18/23.
//

import Foundation
import UIKit
public class ContactSupportViewConfig {
    public init() {}
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
    
    public var subjectTextFieldFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public var subjectTextFieldPlaceHolderFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    public var subjectTextFieldPlaceHolder = "Please insert the subject"
    public var subjectTextFieldPlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
    
    public var subjectTextFieldBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198)
    public var subjectTextFieldBorderWidth: CGFloat = 1.0
    public var subjectTextFieldRadius: CGFloat = 20.0
    public var subjectTextFieldTextColor: UIColor = .black
    public var subjectTextFieldBackColor: UIColor = .blue
    
    public var emailTextFieldPlaceHolderFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    public var emailTextFieldFont = UIFont.systemFont(ofSize: 14, weight: .regular)
    public var emailTextFieldPlaceHolder = "Please insert the email"
    public var emailTextFieldPlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
    public var emailTextFieldBorderColor: UIColor = UIColor(r: 198, g: 198, b: 198)
    public var emailTextFieldBorderWidth: CGFloat = 1.0
    public var emailTextFieldRadius: CGFloat = 20.0
    public var emailTextFieldTextColor: UIColor = .black
    public var emailTextFieldBackColor: UIColor = .blue
    
    
    public var messagePlaceHolder = "Please insert your message in less than 600 character"
    public var messagePlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
    public var messagePlaceHolderFont = UIFont.systemFont(ofSize: 10, weight: .regular)
    
    public var messageTextFiledFont = UIFont.systemFont(ofSize: 14, weight: .regular)
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
    
    
    public var successTitle: String = "Success!"
    public var successMessage: String = "Your message has been sent successfully. We'll get back to you soon."
    
    
    public var errorTitle: String = "Error"
    public var errorMessage: String = "Failed to send your message. Please try again later.\n"
    
    // MARK: - Alert View Configuration
    // Container
    public var alertContainerBackgroundColor: UIColor = .white
    public var alertContainerCornerRadius: CGFloat = 16
    public var alertContainerWidth: CGFloat = 300
    public var alertContainerShadowColor: UIColor = .black
    public var alertContainerShadowOpacity: Float = 0.2
    public var alertContainerShadowOffset: CGSize = CGSize(width: 0, height: 4)
    public var alertContainerShadowRadius: CGFloat = 12
    
    // Overlay
    public var alertOverlayBackgroundColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    
    // Icon
    public var alertIconSize: CGFloat = 60
    public var alertIconTopMargin: CGFloat = 32
    public var alertSuccessIconName: String = "checkmark-circle-fill"
    public var alertErrorIconName: String = "xmark-circle-fill"
    public var alertSuccessIconColor: UIColor = .systemGreen
    public var alertErrorIconColor: UIColor = .systemRed
    
    // Title
    public var alertTitleFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    public var alertTitleTopMargin: CGFloat = 20
    public var alertSuccessTitleColor: UIColor = .systemGreen
    public var alertErrorTitleColor: UIColor = .systemRed
    
    // Message
    public var alertMessageFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    public var alertMessageColor: UIColor = .gray
    public var alertMessageTopMargin: CGFloat = 12
    
    // Button
    public var alertButtonFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    public var alertButtonTitle: String = "OK"
    public var alertButtonCornerRadius: CGFloat = 8
    public var alertButtonHeight: CGFloat = 48
    public var alertButtonTopMargin: CGFloat = 24
    public var alertButtonBottomMargin: CGFloat = 24
    public var alertSuccessButtonBackgroundColor: UIColor = .systemGreen
    public var alertErrorButtonBackgroundColor: UIColor = .systemRed
    public var alertButtonTitleColor: UIColor = .white
    
    // Spacing
    public var alertHorizontalPadding: CGFloat = 24
    
    // Animation
    public var alertFadeAnimationDuration: TimeInterval = 0.3
    public var alertScaleAnimationDuration: TimeInterval = 0.5
    public var alertScaleAnimationDamping: CGFloat = 0.7
    public var alertScaleAnimationVelocity: CGFloat = 0.5
    public var alertInitialScale: CGFloat = 0.8
}
