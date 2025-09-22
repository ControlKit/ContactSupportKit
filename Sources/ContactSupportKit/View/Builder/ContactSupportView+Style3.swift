//
//  ContactSupportView+Style3.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 9/4/25.
//
import Foundation
import UIKit

public class ContactSupportView_Style3: UIView, ContactSupportViewProtocol, UITextViewDelegate {
    var config: ContactSupportViewConfig
    var viewModel: ContactSupportViewModel
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(subjectLabel)
        contentView.addSubview(subjectTextField)
        contentView.addSubview(emailLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(messageLabel)
        contentView.addSubview(messageView)
        contentView.addSubview(messagePlaceholderLabel)
        contentView.addSubview(sendButton)
        contentView.addSubview(cancelButton)
        commonInit()
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
    
    public func setTitleLabelConstraint() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1,
            constant: 55).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: titleLabel,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 36).isActive = true
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
            constant: 46).isActive = true
        subjectLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        subjectLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
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
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        subjectTextField.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
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
            constant: 33).isActive = true
        emailLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        emailLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
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
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        emailTextField.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
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
            constant: 33).isActive = true
        messageLabel.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        messageLabel.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
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
            equalTo: contentView.leadingAnchor,
            constant: 24).isActive = true
        messageView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -24).isActive = true
        NSLayoutConstraint(
            item: messageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 200).isActive = true
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
            toItem: contentView,
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
            constant: 52).isActive = true
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
            toItem: contentView,
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
            constant: 52).isActive = true
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

public class ContactSupportViewConfig_Style3: ContactSupportViewConfig {
    public override init(lang: String) {
        super.init(lang: lang)
        style = .style3
        contentViewBackColor = UIColor(r: 49, g: 49, b: 49)
        titleColor = .white
        
        subjectTextColor = UIColor(r: 235, g: 235, b: 235)
        emailTextColor = UIColor(r: 235, g: 235, b: 235)
        messageTextColor = UIColor(r: 235, g: 235, b: 235)
        
        subjectTextFieldBackColor = UIColor(r: 48, g: 48, b: 48)
        emailTextFieldBackColor = UIColor(r: 48, g: 48, b: 48)
        messageTextFieldBackColor = UIColor(r: 48, g: 48, b: 48)
        
        subjectTextFieldRadius = 20.0
        emailTextFieldRadius = 20.0
        messageTextFieldRadius = 20.0
        
        subjectTextFieldBorderColor = UIColor(r: 48, g: 48, b: 48)
        emailTextFieldBorderColor = UIColor(r: 48, g: 48, b: 48)
        messageTextFieldBorderColor = UIColor(r: 48, g: 48, b: 48)
        
        subjectTextFieldPlaceHolderColor = UIColor(r: 167, g: 167, b: 167)
        emailTextFieldPlaceHolderColor = UIColor(r: 167, g: 167, b: 167)
        messagePlaceHolderColor = UIColor(r: 167, g: 167, b: 167)
        
        sendButtonBackColor = UIColor(r: 163, g: 163, b: 163)
        cancelButtonBackColor = .clear
        cancelButtonTitleColor = UIColor(r: 235, g: 235, b: 235)
        cancelButtonBorderColor = UIColor(r: 163, g: 163, b: 163)
        sendButtonBorderColor = .clear
        sendButtonTitleColor = .black
        sendButtonRadius = 20.0
        cancelButtonRadius = 20.0
    }
}
