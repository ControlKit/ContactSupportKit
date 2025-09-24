//
//  ContactSupportViewProtocol.swift
//
//
//  Created by Maziar Saadatfar on 10/16/23.
//

import Foundation
import UIKit
public protocol ContactSupportViewDelegate: AnyObject {
    func send(request: ContactSupportViewRequest)
    func cancel()
}
public protocol ContactSupportViewProtocol: UIView {
    var delegate: ContactSupportViewDelegate? { get set }
}

public extension ContactSupportViewProtocol {
}
