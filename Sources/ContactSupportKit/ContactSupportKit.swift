// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import Combine

public let contactSupportKit_Version: String = "1.0.0"
public class ContactSupportKit {
    public init() {
    }
    
    @MainActor
    public func configure(root: UIViewController,
                          modalPresentationStyle: UIModalPresentationStyle = .fullScreen,
                          config: ContactSupportServiceConfig) async {
        Task {
            let viewModel = DefaultContactSupportViewModel(serviceConfig: config)
            let contactSupportVC = ContactSupportViewController(
                viewModel: viewModel,
                config: config
            )
            contactSupportVC.modalPresentationStyle = modalPresentationStyle
            DispatchQueue.main.async {
                root.present(contactSupportVC, animated: true)
            }
        }
    }
}
