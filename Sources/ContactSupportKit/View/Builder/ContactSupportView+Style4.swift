//
//  ContactSupportView+Style4.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 9/4/25.
//
import Foundation
import UIKit

public class ContactSupportView_Style4: UIView, ContactSupportViewProtocol, UITextViewDelegate {
    var config: ContactSupportViewConfig
    var viewModel: ContactSupportViewModel
    public weak var delegate: ContactSupportViewDelegate?
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.contentViewBackColor
        return contentView
    }()
    lazy var containerView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = config.containerViewBackColor
        contentView.setCurvedView(cornerRadius: 20)
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
        textField.font = config.subjectTextFieldFont
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            textField.setCurvedView(
                cornerRadius: self.config.subjectTextFieldRadius,
                borderWidth: self.config.subjectTextFieldBorderWidth,
                borderColor: self.config.subjectTextFieldBorderColor
            )
        }
        textField.textAlignment = .left
        textField.backgroundColor = config.subjectTextFieldBackColor
        let attributes = [
            NSAttributedString.Key.foregroundColor: config.subjectTextFieldPlaceHolderColor,
            NSAttributedString.Key.font : config.subjectTextFieldPlaceHolderFont
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: config.subjectTextFieldPlaceHolder,
            attributes:attributes
        )
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        textField.rightViewMode = .always
        textField.leftViewMode = .always
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
        textField.font = config.emailTextFieldFont
        textField.setCurvedView(
            cornerRadius: config.emailTextFieldRadius,
            borderWidth: config.emailTextFieldBorderWidth,
            borderColor: config.emailTextFieldBorderColor
        )
        textField.textAlignment = .left
        textField.backgroundColor = config.emailTextFieldBackColor
        let attributes = [
            NSAttributedString.Key.foregroundColor: config.emailTextFieldPlaceHolderColor,
            NSAttributedString.Key.font : config.emailTextFieldPlaceHolderFont
        ]
        textField.attributedPlaceholder = NSAttributedString(
            string: config.emailTextFieldPlaceHolder,
            attributes:attributes
        )
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
        textField.rightViewMode = .always
        textField.leftViewMode = .always
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
            borderColor: config.messageTextFieldBorderColor
        )
        descriptionView.delegate = self
        descriptionView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
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
    
    lazy var buttonsView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        return contentView
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = config.sendButtonBackColor
        button.titleLabel?.textColor = config.sendButtonTitleColor
        button.setTitle(config.sendButtonTitle, for: .normal)
        button.setCurvedView(cornerRadius: config.sendButtonRadius,
                             borderWidth: config.sendButtonBorderWidth,
                             borderColor: config.sendButtonBorderColor)
        button.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
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
        containerView.addSubview(buttonsView)
        buttonsView.addSubview(sendButton)
        buttonsView.addSubview(cancelButton)
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
        setButtonsViewConstraint()
        setSendButtonConstraint()
        setCancelButtonConstraint()
    }
    public func setContainerViewConstraint() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: containerView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1,
            constant: 0).isActive = true
        containerView.leadingAnchor.constraint(
            equalTo: contentView.leadingAnchor,
            constant: 0).isActive = true
        containerView.trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: containerView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 667).isActive = true
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
            constant: 40).isActive = true
        titleLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 24).isActive = true
        titleLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
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
            equalTo: containerView.leadingAnchor,
            constant: 24).isActive = true
        subjectLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
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
            equalTo: containerView.leadingAnchor,
            constant: 24).isActive = true
        subjectTextField.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
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
            constant: 32).isActive = true
        emailLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 24).isActive = true
        emailLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
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
            equalTo: containerView.leadingAnchor,
            constant: 24).isActive = true
        emailTextField.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
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
            constant: 32).isActive = true
        messageLabel.leadingAnchor.constraint(
            equalTo: containerView.leadingAnchor,
            constant: 24).isActive = true
        messageLabel.trailingAnchor.constraint(
            equalTo: containerView.trailingAnchor,
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
            constant: 160).isActive = true
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
            constant: 16).isActive = true
        messagePlaceholderLabel.leadingAnchor.constraint(
            equalTo: messageView.leadingAnchor,
            constant: 16).isActive = true
        messagePlaceholderLabel.trailingAnchor.constraint(
            equalTo: messageView.trailingAnchor,
            constant: -16).isActive = true
    }
    public func setButtonsViewConstraint() {
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: buttonsView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: containerView,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: buttonsView,
            attribute: .top,
            relatedBy: .equal,
            toItem: messageView,
            attribute: .bottom,
            multiplier: 1,
            constant: 32).isActive = true
        NSLayoutConstraint(
            item: buttonsView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 52).isActive = true
        NSLayoutConstraint(
            item: buttonsView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 382).isActive = true
    }
    public func setSendButtonConstraint() {
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(
            item: sendButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: buttonsView,
            attribute: .top,
            multiplier: 1,
            constant: 0).isActive = true
        sendButton.trailingAnchor.constraint(
            equalTo: buttonsView.trailingAnchor,
            constant: 0).isActive = true
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
            constant: 188).isActive = true
    }
    public func setCancelButtonConstraint() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.leadingAnchor.constraint(
            equalTo: buttonsView.leadingAnchor,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: cancelButton,
            attribute: .top,
            relatedBy: .equal,
            toItem: buttonsView,
            attribute: .top,
            multiplier: 1,
            constant: 0).isActive = true
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
            constant: 188).isActive = true
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
    @objc
    func sendButtonPressed() {
        let request = ContactSupportViewRequest(
            email: emailTextField.text ?? "",
            subject: subjectTextField.text ?? "",
            message: messageView.text ?? ""
        )
        delegate?.send(request: request)
    }
    @objc
    func cancelButtonPressed() {
        delegate?.cancel()
    }
}

public class ContactSupportViewConfig_Style4: ContactSupportViewConfig {
    public override init() {
        super.init()
        style = .style4
        containerViewBackColor = .white
        contentViewBackColor = UIColor(r: 133, g: 176, b: 227)
        
        titleColor = UIColor(r: 83, g: 110, b: 141)
        titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        subjectTextColor = UIColor(r: 83, g: 110, b: 141)
        emailTextColor = UIColor(r: 83, g: 110, b: 141)
        messageTextColor = UIColor(r: 83, g: 110, b: 141)
        
        subjectTextFieldBackColor = .clear
        emailTextFieldBackColor = .clear
        messageTextFieldBackColor = .clear
        
        subjectTextFieldBorderColor = UIColor(r: 197, g: 222, b: 252)
        emailTextFieldBorderColor = UIColor(r: 197, g: 222, b: 252)
        messageTextFieldBorderColor = UIColor(r: 197, g: 222, b: 252)
        
        subjectTextFieldPlaceHolderColor = UIColor(r: 120, g: 139, b: 168)
        emailTextFieldPlaceHolderColor = UIColor(r: 120, g: 139, b: 168)
        messagePlaceHolderColor = UIColor(r: 120, g: 139, b: 168)
        
        subjectTextFieldRadius = 20.0
        emailTextFieldRadius = 20.0
        messageTextFieldRadius = 20.0
        
        sendButtonBackColor = UIColor(r: 133, g: 176, b: 227)
        cancelButtonBackColor = .clear
        cancelButtonTitleColor = UIColor(r: 133, g: 176, b: 227)
        cancelButtonBorderColor = UIColor(r: 133, g: 176, b: 227)
        sendButtonBorderColor = .clear
        sendButtonTitleColor = .white
        sendButtonRadius = 20.0
        cancelButtonRadius = 20.0
        
        alertSuccessIconColor = UIColor(r: 133, g: 176, b: 227)
        alertErrorIconColor = .systemRed
        alertSuccessButtonBackgroundColor = UIColor(r: 133, g: 176, b: 227)
        alertSuccessTitleColor = UIColor(r: 133, g: 176, b: 227)
    }
}
