//
//  File.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit

public class ContactSupportView_Style1: UIView, ContactSupportViewProtocol, UITextViewDelegate {
    var config: ContactSupportViewConfig
    var viewModel: ContactSupportViewModel
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    lazy var containerView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.containerViewBackColor
        contentView.setCurvedView(cornerRadius: 25)
        return contentView
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = config.titleFont
        label.text = config.titleText
        label.textColor = config.titleColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var subjectLabel: UILabel = {
        let label = UILabel()
        label.font = config.subjectLabelFont
        label.text = config.subjectText
        label.textColor = config.subjectTextColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var subjectTextField: UITextField = {
        let textField = UITextField()
        textField.font = config.subjectTextFiledFont
        textField.placeholder = config.subjectTextFieldPlaceHolder
        textField.setCurvedView(
            cornerRadius: config.subjectTextFieldRadius,
            borderWidth: config.subjectTextFieldBorderWidth,
            borderColor: config.subjectTextFieldBackColor
        )
        textField.textAlignment = .left
        textField.backgroundColor = config.subjectTextFieldBackColor
        return textField
    }()
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = config.emailLabelFont
        label.text = config.emailText
        label.textColor = config.emailTextColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = config.emailTextFiledFont
        textField.placeholder = config.emailTextFieldPlaceHolder
        textField.setCurvedView(
            cornerRadius: config.emailTextFieldRadius,
            borderWidth: config.emailTextFieldBorderWidth,
            borderColor: config.emailTextFieldBackColor
        )
        textField.textAlignment = .left
        textField.backgroundColor = config.emailTextFieldBackColor
        return textField
    }()
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.font = config.messageLabelFont
        label.text = config.messageText
        label.textColor = config.messageTextColor
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    lazy var messageView: UITextView = {
        let descriptionView = UITextView()
        descriptionView.font = config.messageTextFiledFont
        descriptionView.textColor = config.messageTextFieldTextColor
        descriptionView.textAlignment = .left
        descriptionView.backgroundColor = config.messageTextFieldBackColor
        descriptionView.setCurvedView(
            cornerRadius: config.messageTextFieldRadius,
            borderWidth: config.messageTextFieldBorderWidth,
            borderColor: config.messageTextFieldBackColor
        )
        descriptionView.delegate = self
        return descriptionView
    }()
    lazy var messagePlaceholderLabel: UILabel = {
        let label = UILabel()
        label.font = config.messagePlaceHolderFont
        label.text = config.messagePlaceHolder
        label.textColor = config.messagePlaceHolderColor
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        return label
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.sendButtonBackColor
        button.titleLabel?.textColor = config.sendButtonTitleColor
        button.setTitle(config.sendButtonTitle, for: .normal)
        button.setCurvedView(cornerRadius: config.sendButtonRadius,
                             borderWidth: config.sendButtonBorderWidth,
                             borderColor: config.sendButtonBorderColor)
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.titleLabel?.font = config.sendButtonFont
        button.setTitleColor(config.sendButtonTitleColor, for: .normal)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.cancelButtonBackColor
        button.titleLabel?.textColor = config.cancelButtonTitleColor
        button.setTitle(config.cancelButtonTitle, for: .normal)
        button.setCurvedView(cornerRadius: config.cancelButtonRadius,
                             borderWidth: config.cancelButtonBorderWidth,
                             borderColor: config.cancelButtonBorderColor)
//        button.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        button.titleLabel?.font = config.cancelButtonFont
        button.setTitleColor(config.cancelButtonTitleColor, for: .normal)
        return button
    }()
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public required init(viewModel: ContactSupportViewModel,
                         config: ContactSupportViewConfig) {
        self.config = config
        self.viewModel = viewModel
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func commonInit() {
        contentView.fixInView(self)
    }
    
    public func setup() {
        addSubview(contentView)
        contentView.fixInView(self)
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subjectLabel)
        containerView.addSubview(subjectTextField)
        containerView.addSubview(emailLabel)
        containerView.addSubview(emailTextField)
        containerView.addSubview(messageLabel)
        containerView.addSubview(messageView)
        containerView.addSubview(messagePlaceholderLabel)
        containerView.addSubview(sendButton)
        containerView.addSubview(cancelButton)
        commonInit()
        setContainerViewConstraint()
        setTitleLabelConstraint()
        setSubjectLabelConstraint()
        setSubjectTextFieldConstraint()
        setEmailLabelConstraint()
        setEmailTextFieldConstraint()
        setMessageLabelConstraint()
        setMessageTextFieldConstraint()
        setMessagePlaceholderConstraint()
        setSendButtonConstraint()
        setCancelButtonConstraint()
    }
    public func setContainerViewConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: containerView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: containerView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerY,
            multiplier: 1,
            constant: 0).isActive = true
        containerView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        containerView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: containerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 700).isActive = true
    }
    public func setTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .top,
            multiplier: 1,
            constant: 44).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 25).isActive = true
    }
    public func setSubjectLabelConstraint() {
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: subjectLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 24).isActive = true
        subjectLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        subjectLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: subjectLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 17).isActive = true
    }
    public func setSubjectTextFieldConstraint() {
        subjectTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: subjectTextField,
            attribute: .top,
            relatedBy: .equal,
            toItem: subjectLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 14).isActive = true
        subjectTextField.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        subjectTextField.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: subjectTextField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 42).isActive = true
    }
    public func setEmailLabelConstraint() {
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: emailLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: subjectTextField,
            attribute: .bottom,
            multiplier: 1,
            constant: 32).isActive = true
        emailLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        emailLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: emailLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 17).isActive = true
    }
    public func setEmailTextFieldConstraint() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: emailTextField,
            attribute: .top,
            relatedBy: .equal,
            toItem: emailLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 14).isActive = true
        emailTextField.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: emailTextField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 42).isActive = true
    }
    public func setMessageLabelConstraint() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: messageLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: emailTextField,
            attribute: .bottom,
            multiplier: 1,
            constant: 32).isActive = true
        messageLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        messageLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: messageLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 17).isActive = true
    }
    public func setMessageTextFieldConstraint() {
        messageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: messageView,
            attribute: .top,
            relatedBy: .equal,
            toItem: messageLabel,
            attribute: .bottom,
            multiplier: 1,
            constant: 14).isActive = true
        messageView.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 16).isActive = true
        messageView.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
            constant: -16).isActive = true
        NSLayoutConstraint(
            item: messageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 146).isActive = true
    }
    
    public func setMessagePlaceholderConstraint() {
        messagePlaceholderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: messagePlaceholderLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: messageView,
            attribute: .top,
            multiplier: 1,
            constant: 8).isActive = true
        messagePlaceholderLabel.leadingAnchor.constraint(
            equalTo: messageView.leadingAnchor,
            constant: 8).isActive = true
        messagePlaceholderLabel.trailingAnchor.constraint(
            equalTo: messageView.trailingAnchor,
            constant: -8).isActive = true
    }
    public func setSendButtonConstraint() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: sendButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: sendButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: messageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 50).isActive = true
        NSLayoutConstraint(
            item: sendButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 37).isActive = true
        NSLayoutConstraint(
            item: sendButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 224).isActive = true
    }
    public func setCancelButtonConstraint() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: sendButton,
            attribute: .bottom,
            multiplier: 1,
            constant: 14).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 37).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 224).isActive = true
    }
    
    // MARK: - UITextViewDelegate
    public func textViewDidChange(_ textView: UITextView) {
        updatePlaceholderVisibility()
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        updatePlaceholderVisibility()
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        updatePlaceholderVisibility()
    }
    
    private func updatePlaceholderVisibility() {
        messagePlaceholderLabel.isHidden = !messageView.text.isEmpty
    }
}

public class ContactSupportViewConfig_Style1: ContactSupportViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .style1
        containerViewBackColor = UIColor(r: 245, g: 254, b: 255)
        contentViewBackColor = UIColor(r: 255, g: 199, b: 0)
        
        titleColor = UIColor(r: 30, g: 30, b: 30)
        titleFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        subjectTextColor = UIColor(r: 84, g: 84, b: 84)
        emailTextColor = UIColor(r: 84, g: 84, b: 84)
        messageTextColor = UIColor(r: 84, g: 84, b: 84)
        
        subjectTextFieldBackColor = .clear
        emailTextFieldBackColor = .clear
        messageTextFieldBackColor = .clear
        
        subjectTextFieldBorderColor = UIColor(r: 198, g: 198, b: 198)
        emailTextFieldBorderColor = UIColor(r: 167, g: 167, b: 167)
        messageTextFieldBorderColor = UIColor(r: 167, g: 167, b: 167)
        
        subjectTextFieldPlaceHolderColor = UIColor(r: 198, g: 198, b: 198)
        emailTextFieldPlaceHolderColor = UIColor(r: 167, g: 167, b: 167)
        messagePlaceHolderColor = UIColor(r: 167, g: 167, b: 167)
        
        subjectTextFieldBorderWidth = 1.0
        emailTextFieldBorderWidth = 1.0
        messageTextFieldBorderWidth = 1.0
        
        subjectTextFieldRadius = 20.0
        emailTextFieldRadius = 20.0
        messageTextFieldRadius = 20.0
        
        sendButtonBackColor = UIColor(r: 163, g: 163, b: 163)
        cancelButtonBackColor = .clear
        cancelButtonTitleColor = UIColor(r: 163, g: 163, b: 163)
        cancelButtonBorderColor = UIColor(r: 163, g: 163, b: 163)
        sendButtonBorderColor = .clear
        sendButtonTitleColor = .black
        sendButtonRadius = 20.0
        cancelButtonRadius = 20.0
    }
}

class ImageHelper {
    static var resolvedBundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: self)
#endif
    }
    
    static func image(_ name: String) -> UIImage? {
        return UIImage(named: name,
                       in: resolvedBundle,
                       compatibleWith: nil)
    }
}
