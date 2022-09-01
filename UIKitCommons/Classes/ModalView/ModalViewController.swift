//
//  ModalViewController.swift
//  CommonUIKit
//
//  Created by Jorge Luis Rivera Ladino on 30/08/22.
//

import UIKit

class ModalViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var backgroundView = UIView()
    
    private lazy var closeButton = UIButton().then {
        $0.addTarget(self, action: #selector(cloaseAction), for: .touchUpInside)
        if #available(iOS 13.0, *) {
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
            $0.tintColor = .darkGray
        }
    }

    private let containerStackView = UIStackView().then {
        $0.axis = .vertical
        $0.backgroundColor = .white
    }
    
    private let contentView = UIView()
    private lazy var buttonPadView = ButtonPadView().then {
        $0.primaryCompletion = { [weak self] in self?.dismissWithEffect(completion: self?.primaryCompletion) }
        $0.secondaryCompletion = { [weak self] in self?.dismissWithEffect(completion: self?.secondaryCompletion) }
    }
    private var buttonPadViewBottomConstraint: NSLayoutConstraint?
    
    private var primaryCompletion: CompletionHandler?
    private var secondaryCompletion: CompletionHandler?
    private var backgroundTapDismissViewCompletion: CompletionHandler?
    private var customView: UIView?
    private var primaryActionText = ""
    private var secondaryActionText: String?
    private var showButtons = true
    private var primaryButtonColor: UIColor?
    private var secondaryButtonColor: UIColor?
    private var primaryButtonTitleColor: UIColor?
    private var secondaryButtonTitleColor: UIColor?
    private var primaryButtonCornerRadius: CGFloat = 8
    private var secondaryButtonCornerRadius: CGFloat = 0
    private var buttonPadAlign: ButtonPadAlign = .horizontal
    private var backgroundTapDismissView = false
    private var closeButtonPaddingTop: CGFloat = 16
    private var closeButtonPaddingRight: CGFloat = 16
    private var closeButtonHeight: CGFloat = 20
    private var closeButtonWidth: CGFloat = 20
    private var buttonsPadSpacing: CGFloat = 0
    private var buttonsPadHorizontalPadding: CGFloat = 0
    private var buttonsPadBottomPadding: CGFloat = 0
    private var buttonsPadCornerRadius: CGFloat = 8
    
    // MARK: - L

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        buttonPadView.alignment = buttonPadAlign
        buttonPadView.buttonsSpacing = buttonsPadSpacing
        buttonPadView.setButtons(horizontalPadding: buttonsPadHorizontalPadding,
                                 cornerRadius: buttonsPadCornerRadius,
                                 primaryButtonCornerRadius: primaryButtonCornerRadius,
                                 secondaryButtonCornerRadius: secondaryButtonCornerRadius)
        buttonPadView.primaryButtonText = primaryActionText
        buttonPadView.primaryButtonColor = primaryButtonColor
        buttonPadView.primaryButtonTitleColor = primaryButtonTitleColor
        if let secondaryTitle = secondaryActionText {
            buttonPadView.secondaryButtonText = secondaryTitle
            buttonPadView.secondaryButtonColor = secondaryButtonColor
            buttonPadView.secondaryButtonTitleColor = secondaryButtonTitleColor
        } else {
            buttonPadView.secondaryButtonHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let customView = customView {
            customView.fixInView(contentView)
        }
        if backgroundTapDismissView {
            let tap = UITapGestureRecognizer(target: self, action: #selector(cloaseAction))
            backgroundView.addGestureRecognizer(tap)
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerStackView.layer.cornerRadius = 8
    }
    
    // MARK: - Internal Methods
    
    func config(_ configuration: ModalConfiguration,
                primaryCompletion: CompletionHandler? = nil,
                secondaryCompletion: CompletionHandler? = nil,
                backgroundTapDismissViewCompletion: CompletionHandler? = nil) {
        customView = configuration.customView
        primaryActionText = configuration.primaryActionText
        primaryButtonColor = configuration.primaryButtonColor ?? .blue
        primaryButtonTitleColor = configuration.primaryButtonTitleColor
        primaryButtonCornerRadius = configuration.primaryButtonCornerRadius ?? 8
        secondaryActionText = configuration.secondaryActionText
        secondaryButtonColor = configuration.secondaryButtonColor ?? .lightGray.withAlphaComponent(0.1)
        secondaryButtonTitleColor = configuration.secondaryButtonTitleColor ?? .black
        secondaryButtonCornerRadius = configuration.secondaryButtonCornerRadius ?? 8
        showButtons = configuration.showButtons
        buttonPadAlign = configuration.buttonPadAligment
        buttonsPadSpacing = configuration.buttonsPadSpacing
        buttonsPadHorizontalPadding = configuration.buttonsPadHorizontalPadding
        buttonsPadBottomPadding = configuration.buttonsPadBottomPadding
        buttonsPadCornerRadius = configuration.buttonsPadCornerRadius
        backgroundTapDismissView = configuration.backgroundTapDismissView
        closeButtonPaddingTop = configuration.closeButtonPaddingTop
        closeButtonPaddingRight = configuration.closeButtonPaddingRight
        closeButtonHeight = configuration.closeButtonHeight
        closeButtonWidth = configuration.closeButtonWidth
        self.primaryCompletion = primaryCompletion
        self.secondaryCompletion = secondaryCompletion
        self.backgroundTapDismissViewCompletion = backgroundTapDismissViewCompletion
    }
    
    // MARK: - Private Methods
    
    private func addSubViews() {
        backgroundView.fixInView(view)
        view.addSubview(containerStackView)
        view.addSubview(closeButton)
        containerStackView.addArrangedSubview(contentView)
        containerStackView.addArrangedSubview(buttonPadView)
        addConstraints()
    }
    
    private func addConstraints() {
        // closeButton
        closeButton.anchor(top: containerStackView.topAnchor,
                           paddingTop:  closeButtonPaddingTop,
                           right: view.rightAnchor,
                           paddingRight: closeButtonPaddingRight,
                           width: closeButtonWidth,
                           height: closeButtonHeight)
        
        // containerStackView
        containerStackView.anchor(bottom: view.bottomAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor)
        
        // buttonPadView
        buttonPadView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: buttonsPadBottomPadding).isActive = true
    }
    
    @objc
    private func cloaseAction() {
        dismissWithEffect()
    }

}
