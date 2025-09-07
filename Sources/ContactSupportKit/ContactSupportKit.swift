// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public class ContactSupportKit {
    public init() {
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: ContactSupportServiceConfig) async {
        Task {
            let viewModel = DefaultContactSupportViewModel(serviceConfig: config)
            let ContactSupportVC = ContactSupportViewController(
                viewModel: viewModel,
                config: config
            )
            ContactSupportVC.modalPresentationStyle = modalPresentationStyle
            DispatchQueue.main.async {
                root.present(ContactSupportVC, animated: true)
            }
        }
    }
}
