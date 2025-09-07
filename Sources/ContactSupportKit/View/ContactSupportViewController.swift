//
//  ContactSupportViewController.swift
//  
//
//  Created by Maziar Saadatfar on 10/21/23.
//

import UIKit

class ContactSupportViewController: UIViewController {
    var viewModel: ContactSupportViewModel
    let config: ContactSupportServiceConfig

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
        let ContactSupportView = ContactSupportViewStyle.make(viewModel: viewModel,
                                                    config: config.viewConfig)
        view.addSubview(ContactSupportView)
        ContactSupportView.fixInView(view)
        Task {
            viewModel.response = try await viewModel.contactSupportService.getContactSupport(request: viewModel.request)
        }
    }
}
