//
//  UIViewController+ModalView.swift
//  CommonUIKit
//
//  Created by Jorge Luis Rivera Ladino on 30/08/22.
//

import Foundation

public extension UIViewController {
    
    /// Present an ModalViewController overFullScreen.
    /// - Parameters:
    ///   - builder: (ModalConfiguration) Model used to configure the view.
    ///   - primaryCompletion: Right button event.
    ///   - secondaryCompletion: Left button event.
    func showModal(_ builder: ModalConfiguration,
                   primaryCompletion: CompletionHandler? = nil,
                   secondaryCompletion: CompletionHandler? = nil,
                   backgroundTapDismissViewCompletion: CompletionHandler? = nil) {
        let viewController = ModalViewController()
        viewController.config(builder,
                              primaryCompletion: primaryCompletion,
                              secondaryCompletion: secondaryCompletion,
                              backgroundTapDismissViewCompletion: backgroundTapDismissViewCompletion)
        presentBottomModal(viewController)
    }
}
