//
//  ContactSupportViewController.swift
//
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

protocol ContactSupportDelegate: AnyObject {
    func success()
    func cancel()
}
class ContactSupportViewController: UIViewController, ContactSupportViewDelegate {
    var viewModel: ContactSupportViewModel
    let config: ContactSupportServiceConfig
    weak var delegate: ContactSupportDelegate?
    init(viewModel: ContactSupportViewModel, config: ContactSupportServiceConfig) {
        self.viewModel = viewModel
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contactSupportView = ContactSupportViewStyle.make(viewModel: viewModel,
                                                              config: config.viewConfig)
        contactSupportView.delegate = self
        view.addSubview(contactSupportView)
        contactSupportView.fixInView(view)
        viewModel.setAction(.view)
    }
    
    func send(request: ContactSupportViewRequest) {
        Task {
            do {
                let _ = try await viewModel.sendContactSupport(viewRequest: request)
                DispatchQueue.main.async {
                    self.showSuccessAlert()
                }
            } catch {
                DispatchQueue.main.async {
                    self.showErrorAlert(error: error)
                }
            }
        }
    }
    
    private func showSuccessAlert() {
        let alertView = AlertView(config: config.viewConfig)
        alertView.configure(
            type: .success,
            title: config.viewConfig.successTitle,
            message: config.viewConfig.successMessage,
            onDismiss: { [weak self] in
                self?.dismiss(animated: true) {
                    self?.delegate?.success()
                }
            }
        )
        alertView.show(in: self.view)
    }
    
    private func showErrorAlert(error: Error) {
        let alertView = AlertView(config: config.viewConfig)
        alertView.configure(
            type: .error,
            title: config.viewConfig.errorTitle,
            message: config.viewConfig.errorMessage + error.localizedDescription,
            onDismiss: nil
        )
        alertView.show(in: self.view)
    }
    
    func cancel() {
        delegate?.cancel()
        dismiss(animated: true)
    }
}
