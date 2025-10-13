//
//  AlertView.swift
//  ContactSupportKit
//
//  Created by Maziar Saadatfar on 10/13/25.
//

import UIKit

public enum AlertType {
    case success
    case error
}

public class AlertView: UIView {
    
    // MARK: - Properties
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var dismissAction: (() -> Void)?
    private var autoDismissTimer: Timer?
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            // Container view
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            
            // Icon
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // Title
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            // Message
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            // Dismiss button
            dismissButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 24),
            dismissButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24),
            dismissButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
    }
    
    // MARK: - Configuration
    public func configure(
        type: AlertType,
        title: String,
        message: String,
        autoDismissAfter seconds: TimeInterval? = nil,
        onDismiss: (() -> Void)? = nil
    ) {
        self.dismissAction = onDismiss
        
        titleLabel.text = title
        messageLabel.text = message
        
        switch type {
        case .success:
            configureSuccessStyle()
        case .error:
            configureErrorStyle()
        }
        
        if let seconds = seconds {
            autoDismissTimer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { [weak self] _ in
                self?.dismiss()
            }
        }
    }
    
    private func configureSuccessStyle() {
        titleLabel.textColor = .systemGreen
        dismissButton.backgroundColor = .systemGreen
        dismissButton.setTitleColor(.white, for: .normal)
        
        // Create success checkmark icon
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .light)
        iconImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: config)
        iconImageView.tintColor = .systemGreen
    }
    
    private func configureErrorStyle() {
        titleLabel.textColor = .systemRed
        dismissButton.backgroundColor = .systemRed
        dismissButton.setTitleColor(.white, for: .normal)
        
        // Create error icon
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .light)
        iconImageView.image = UIImage(systemName: "xmark.circle.fill", withConfiguration: config)
        iconImageView.tintColor = .systemRed
    }
    
    // MARK: - Actions
    @objc private func dismissTapped() {
        dismiss()
    }
    
    private func dismiss() {
        autoDismissTimer?.invalidate()
        autoDismissTimer = nil
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
            self.dismissAction?()
        }
    }
    
    // MARK: - Public Methods
    public func show(in view: UIView) {
        frame = view.bounds
        alpha = 0
        view.addSubview(self)
        
        // Animate in
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
        
        // Scale animation for container
        containerView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.5,
            options: .curveEaseOut,
            animations: {
                self.containerView.transform = .identity
            }
        )
    }
    
    deinit {
        autoDismissTimer?.invalidate()
    }
}
