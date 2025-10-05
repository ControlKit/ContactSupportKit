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
    }
    
    func send(request: ContactSupportViewRequest) {
        Task {
            let _ = try await viewModel.sendContactSupport(viewRequest: request)
            DispatchQueue.main.async {
                self.dismiss(animated: true) {
                    self.delegate?.success()
                }
            }
        }
    }
    
    func cancel() {
        delegate?.cancel()
        dismiss(animated: true)
    }
}
