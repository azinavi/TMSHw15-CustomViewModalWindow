//
//  ViewController.swift
//  CustomViewModalWindow
//
//  Created by azinavi on 12/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    var showModalButton = UIButton()
    var label = UILabel()
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var modalWindow = CustomButtons(frame: CGRect(x: 0, y: 0, width: 300, height: 200))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupShowModalButton()
        modalWindow.delegate = self
    }
    
    func setupView() {
        view.backgroundColor = .black
    }
    
    func setupShowModalButton() {
        view.addSubview(showModalButton)
        showModalButton.frame = CGRect(x: (screenSize.width / 2) - 70, y: (screenSize.height / 2) - 20, width: 140, height: 40)
        showModalButton.backgroundColor = .yellow
        showModalButton.setTitle("Show modal", for: .normal)
        showModalButton.setTitleColor(.black, for: .normal)
        showModalButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
    }
    @objc func showModal() {
        view.addSubview(modalWindow)
        modalWindow.frame = CGRect(x: (screenSize.width / 2) - 150, y: (screenSize.height / 2) - 100, width: 300, height: 200)
    }
    
}

extension ViewController: CustomButtonsDelegate {
    func ignoreButtonPressed(text: String) {
        view.addSubview(label)
        label.frame = CGRect(x: (screenSize.width / 2) - 130, y: 120, width: 260, height: 40)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .red
        view.backgroundColor = .black
    }

    func gotItButtonPressed(color: UIColor, text: String ) {
        view.backgroundColor = color
        label.frame = CGRect(x: (screenSize.width / 2) - 130, y: 120, width: 260, height: 40)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .green
    }
    
}
