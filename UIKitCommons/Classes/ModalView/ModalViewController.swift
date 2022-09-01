//
//  ModalViewController.swift
//  CommonUIKit
//
//  Created by Jorge Luis Rivera Ladino on 30/08/22.
//

import UIKit

class ModalViewController: UIViewController {
    
    // MARK: - Private UI Properties
    
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
    
    // MARK: - Private Properties
    
    private var configuration = ModalConfiguration()
    
    // MARK: - Private Closure Properties
    
    private var primaryCompletion: CompletionHandler?
    private var secondaryCompletion: CompletionHandler?
    private var backgroundTapDismissViewCompletion: CompletionHandler?
    
    // MARK: - UIViewController Lyfecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        buttonPadView.underlineButtonsWhenHasNoBackgroundColor = configuration.underlineButtonsWhenHasNoBackgroundColor
        buttonPadView.alignment = configuration.buttonPadAligment
        buttonPadView.buttonsSpacing = configuration.buttonsPadSpacing
        buttonPadView.setButtons(horizontalPadding: configuration.buttonsPadHorizontalPadding,
                                 cornerRadius: configuration.buttonsPadCornerRadius,
                                 primaryButtonCornerRadius: configuration.primaryButtonCornerRadius,
                                 secondaryButtonCornerRadius: configuration.secondaryButtonCornerRadius)
        buttonPadView.primaryButtonText = configuration.primaryActionText
        buttonPadView.primaryButtonColor = configuration.primaryButtonColor
        buttonPadView.primaryButtonTitleColor = configuration.primaryButtonTitleColor
        if let secondaryTitle = configuration.secondaryActionText {
            buttonPadView.secondaryButtonText = secondaryTitle
            buttonPadView.secondaryButtonColor = configuration.secondaryButtonColor
            buttonPadView.secondaryButtonTitleColor = configuration.secondaryButtonTitleColor
        } else {
            buttonPadView.secondaryButtonHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let customView = configuration.customView {
            customView.fixInView(contentView)
        }
        if configuration.backgroundTapDismissView {
            let tap = UITapGestureRecognizer(target: self, action: #selector(cloaseAction))
            backgroundView.addGestureRecognizer(tap)
        }
    }
    
    // MARK: - Override Methods
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerStackView.layer.cornerRadius = 8
    }
    
    // MARK: - Internal Methods
    
    func config(_ configuration: ModalConfiguration,
                primaryCompletion: CompletionHandler? = nil,
                secondaryCompletion: CompletionHandler? = nil,
                backgroundTapDismissViewCompletion: CompletionHandler? = nil) {
        self.configuration = configuration
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
                           paddingTop:  configuration.closeButtonPaddingTop,
                           right: view.rightAnchor,
                           paddingRight: configuration.closeButtonPaddingRight,
                           width: configuration.closeButtonWidth,
                           height: configuration.closeButtonHeight)
        
        // containerStackView
        containerStackView.anchor(bottom: view.bottomAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor)
        
        // buttonPadView
        buttonPadView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: configuration.buttonsPadBottomPadding).isActive = true
    }
    
    // MARK: - Private @objc Methods
    
    @objc
    private func cloaseAction() {
        dismissWithEffect()
    }

}
