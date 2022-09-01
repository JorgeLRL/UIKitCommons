//
//  ButtonPadView.swift
//  CommonUIKit
//
//  Created by Jorge Luis Rivera Ladino on 31/08/22.
//

import UIKit

class ButtonPadView: BaseUIView {
    
    private let containerStackView = UIStackView().then {
        $0.distribution = .fillEqually
    }
    private lazy var primaryButton = UIButton().then {
        $0.addAction(for: .touchUpInside) { [weak self] in
            self?.primaryCompletion?()
        }
    }
    private lazy var secondaryButton = UIButton().then {
        $0.addAction(for: .touchUpInside) { [weak self] in
            self?.secondaryCompletion?()
        }
    }
    
    public var buttonsSpacing: CGFloat = 0 {
        didSet { containerStackView.spacing = buttonsSpacing }
    }
    
    public var buttonsHorizontalPadding: CGFloat = 0 {
        didSet { setButtonsHorizontalPadding() }
    }
    
    /// Set the left button text
    public var primaryButtonText: String = String() {
        didSet {
            setPrimaryButtonText()
        }
    }
    
    public var primaryButtonColor: UIColor? {
        didSet {
            primaryButton.backgroundColor = primaryButtonColor
        }
    }
    
    public var primaryButtonTitleColor: UIColor? {
        didSet {
            primaryButton.setTitleColor(primaryButtonTitleColor, for: .normal)
        }
    }

    /// Set the right button text
    public var secondaryButtonText: String = String() {
        didSet {
            setSecondaryButtonText()
        }
    }
    
    public var secondaryButtonColor: UIColor? {
        didSet {
            secondaryButton.backgroundColor = secondaryButtonColor
        }
    }
    
    public var secondaryButtonTitleColor: UIColor? {
        didSet {
            secondaryButton.setTitleColor(secondaryButtonTitleColor, for: .normal)
        }
    }

    public var secondaryButtonHidden: Bool = false {
        didSet {
            secondaryButton.isHidden = secondaryButtonHidden
        }
    }
    
    public var alignment: ButtonPadAlign = .horizontal {
        didSet {
            setButtonsDisplay()
        }
    }
    
    public var primaryCompletion: CompletionHandler?
    public var secondaryCompletion: CompletionHandler?
    
    override func configureView() {
        super.configureView()
        addSubViews()
    }
    
    public func setButtons(horizontalPadding: CGFloat, cornerRadius: CGFloat, primaryButtonCornerRadius: CGFloat, secondaryButtonCornerRadius: CGFloat) {
        buttonsHorizontalPadding = horizontalPadding
        setButtonsCornerRadius(cornerRadius)
        setPrimaryButtonCornerRadius(primaryButtonCornerRadius)
        setSecondaryButtonCornerRadius(secondaryButtonCornerRadius)
    }
    
    private func addSubViews() {
        containerStackView.fixInView(self)
        containerStackView.addArrangedSubview(secondaryButton)
        containerStackView.addArrangedSubview(primaryButton)
        addConstraints()
    }
    
    private func addConstraints() {
        // primaryButton
        primaryButton.anchor(height: 48,
                             identifier: "primaryButton")
        
        // secondaryButton
        secondaryButton.anchor(height: 48,
                               identifier: "secondaryButton")
    }
    
    private func setButtonsDisplay() {
        switch alignment {
        case .horizontal:
            containerStackView.axis = .horizontal
        case .vertical:
            if let secondaryButtonView = containerStackView.subviews.first {
                containerStackView.removeArrangedSubview(secondaryButtonView)
                containerStackView.setNeedsLayout()
                containerStackView.layoutIfNeeded()
                
                containerStackView.insertArrangedSubview(secondaryButtonView, at: 1)
                containerStackView.setNeedsLayout()
                containerStackView.axis = .vertical
                
                primaryButton.anchor(left: leftAnchor,
                                     paddingLeft: 34,
                                     right: rightAnchor,
                                     paddingRight: 34,
                                     identifier: "primaryButton")
                
                secondaryButton.anchor(left: leftAnchor,
                                       paddingLeft: 34,
                                       right: rightAnchor,
                                       paddingRight: 34,
                                       identifier: "secondaryButton")
            }
        }
    }
    
    private func setPrimaryButtonText() {
        primaryButton.setTitle(primaryButtonText, for: .normal)
    }
    
    private func setPrimaryButtonCornerRadius(_ cornerRadius: CGFloat) {
        guard alignment != .horizontal, buttonsHorizontalPadding > 0 else {
            return
        }
        primaryButton.layer.cornerRadius = cornerRadius
    }
    
    private func setSecondaryButtonCornerRadius(_ cornerRadius: CGFloat) {
        guard alignment != .horizontal, buttonsHorizontalPadding > 0 else {
            return
        }
        secondaryButton.layer.cornerRadius = cornerRadius
    }
    
    private func setButtonsCornerRadius(_ cornerRadius: CGFloat) {
        guard alignment != .vertical, buttonsHorizontalPadding > 0 else {
            return
        }
        containerStackView.layer.cornerRadius = cornerRadius
        containerStackView.clipsToBounds = true
    }
    
    private func setSecondaryButtonText() {
        secondaryButton.setTitle(secondaryButtonText, for: .normal)
    }
    
    private func setButtonsHorizontalPadding() {
        switch alignment {
        case .horizontal:
            containerStackView.anchor(left: leftAnchor,
                                      paddingLeft: buttonsHorizontalPadding,
                                      right: rightAnchor,
                                      paddingRight: buttonsHorizontalPadding,
                                      identifier: "containerStackView")
        case .vertical:
            updateConstraint(identifier: "primaryButtonLeft", constant: buttonsHorizontalPadding)
            updateConstraint(identifier: "primaryButtonRight", constant: -buttonsHorizontalPadding)
            updateConstraint(identifier: "secondaryButtonLeft", constant: buttonsHorizontalPadding)
            updateConstraint(identifier: "secondaryButtonRight", constant: -buttonsHorizontalPadding)
        }
    }
    
}
