//
//  ModalBuilder.swift
//  CommonUIKit
//
//  Created by Jorge Luis Rivera Ladino on 30/08/22.
//

import Foundation
import UIKit

public class ModalConfiguration {
    
    // MARK: - Internal Properties
    
    private(set) var customView: UIView?
    private(set) var primaryActionText: String
    private(set) var secondaryActionText: String?
    private(set) var showButtons: Bool
    private(set) var primaryButtonColor: UIColor?
    private(set) var secondaryButtonColor: UIColor?
    private(set) var primaryButtonTitleColor: UIColor?
    private(set) var secondaryButtonTitleColor: UIColor?
    private(set) var primaryButtonCornerRadius: CGFloat
    private(set) var secondaryButtonCornerRadius: CGFloat
    private(set) var buttonPadAligment: ButtonPadAlign
    private(set) var backgroundTapDismissView: Bool
    private(set) var closeButtonPaddingTop: CGFloat
    private(set) var closeButtonPaddingRight: CGFloat
    private(set) var closeButtonHeight: CGFloat
    private(set) var closeButtonWidth: CGFloat
    private(set) var buttonsPadSpacing: CGFloat
    private(set) var buttonsPadHorizontalPadding: CGFloat
    private(set) var buttonsPadBottomPadding: CGFloat
    private(set) var buttonsPadCornerRadius: CGFloat
    private(set) var underlineButtonsWhenHasNoBackgroundColor: Bool
    
    // MARK: - Initializers
    
    public init(customView: UIView? = nil,
                primaryActionText: String = "Aceptar",
                primaryButtonColor: UIColor? = .blue,
                primaryButtonTitleColor: UIColor? = nil,
                primaryButtonCornerRadius: CGFloat = 8,
                secondaryActionText: String? = nil,
                secondaryButtonColor: UIColor? = .lightGray.withAlphaComponent(0.1),
                secondaryButtonTitleColor: UIColor? = .black,
                secondaryButtonCornerRadius: CGFloat = 8,
                showButtons: Bool = true,
                buttonPadAligment: ButtonPadAlign = .horizontal,
                buttonsPadSpacing: CGFloat = 0,
                buttonsPadHorizontalPadding: CGFloat = 34,
                buttonsPadBottomPadding: CGFloat = 0,
                buttonsPadCornerRadius: CGFloat = 8,
                backgroundTapDismissView: Bool = false,
                closeButtonPaddingTop: CGFloat = 16,
                closeButtonPaddingRight: CGFloat = 16,
                closeButtonHeight: CGFloat = 20,
                closeButtonWidth: CGFloat = 20,
                underlineButtonsWhenHasNoBackgroundColor: Bool = false) {
        self.customView = customView
        self.primaryActionText = primaryActionText
        self.primaryButtonColor = primaryButtonColor
        self.primaryButtonTitleColor = primaryButtonTitleColor
        self.primaryButtonCornerRadius = primaryButtonCornerRadius
        self.secondaryActionText = secondaryActionText
        self.secondaryButtonColor = secondaryButtonColor
        self.secondaryButtonTitleColor = secondaryButtonTitleColor
        self.secondaryButtonCornerRadius = secondaryButtonCornerRadius
        self.showButtons = showButtons
        self.buttonPadAligment = buttonPadAligment
        self.buttonsPadSpacing = buttonsPadSpacing
        self.buttonsPadHorizontalPadding = buttonsPadHorizontalPadding
        self.buttonsPadBottomPadding = buttonsPadBottomPadding
        self.backgroundTapDismissView = backgroundTapDismissView
        self.closeButtonPaddingTop = closeButtonPaddingTop
        self.closeButtonPaddingRight = closeButtonPaddingRight
        self.closeButtonHeight = closeButtonHeight
        self.closeButtonWidth = closeButtonWidth
        self.buttonsPadCornerRadius = buttonsPadCornerRadius
        self.underlineButtonsWhenHasNoBackgroundColor = underlineButtonsWhenHasNoBackgroundColor
    }
    
}
