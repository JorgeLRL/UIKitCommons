//
//  ViewController.swift
//  UIKitCommons
//
//  Created by luisMan97 on 09/01/2022.
//  Copyright (c) 2022 luisMan97. All rights reserved.
//

import UIKit
import UIKitCommons

class ViewController: UIViewController {
    
    private lazy var tableView = UITableView().then {
        $0.dataSource = self
        $0.delegate = self
    }
    
    enum Options: String, CaseIterable {
        case modal = "Modal"
    }
    
    let options = Options.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addSubView()
    }
    
    private func addSubView() {
        tableView.fixInView(view)
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1). \(options[indexPath.row].rawValue)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            showModal()
        default: break
        }
    }
    
    private func showModal() {
        let modalConfiguration = ModalConfiguration(customView: buildAlertView(),
                                                    secondaryActionText: "Cancelar",
                                                    secondaryButtonColor: .clear,
                                                    buttonPadAligment: .vertical,
                                                    underlineButtonsWhenHasNoBackgroundColor: true)
        showModal(modalConfiguration)
    }
    
    private func buildAlertView() -> AlertView {
        let alertView = AlertView().then {
            $0.frame = CGRect(x: 0, y: 0, width: 0, height: 250)
            if #available(iOS 13.0, *) {
                $0.alertImage = UIImage(systemName: "pencil.circle.fill")
            }
            $0.titleText = "title"
            $0.messageText = "description"
            $0.titleTextColor = .blue
        }
        return alertView
    }
    
}
