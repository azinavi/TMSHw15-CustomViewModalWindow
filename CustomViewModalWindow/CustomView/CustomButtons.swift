//
//  CustomButtons.swift
//  CustomViewModalWindow
//
//  Created by azinavi on 12/1/24.
//

import UIKit
import SnapKit

protocol CustomButtonsDelegate: AnyObject {
    func ignoreButtonPressed(text: String)
    func gotItButtonPressed(color: UIColor, text: String)
}

class CustomButtons: UIView {
    let screenSize: CGRect = UIScreen.main.bounds
    
    weak var delegate: CustomButtonsDelegate?
    
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    var ignoreButton = UIView()
    var ignoreButtonTitle = UILabel()
    var gotItButton = UIView()
    var gotItButtonTitle = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupIgnoreButton()
        setupGotItButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupBackView() {
        backgroundColor = .white
        layer.borderWidth = 7
        layer.borderColor = UIColor.gray.cgColor
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.text = "Offer"
        titleLabel.frame = CGRect(x: 120, y: 20, width: 60, height: 30)
        titleLabel.font = .boldSystemFont(ofSize: 25)
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .lightGray
        descriptionLabel.text = "A set of 130 elements, perfectly fitting each other. Click, drag, resize, adapt, combine."
        descriptionLabel.font = .systemFont(ofSize: 12)
        
        descriptionLabel.snp.makeConstraints{(make) in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(20)
            make.left.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.equalTo(safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func setupIgnoreButton() {
        ignoreButton.backgroundColor = .darkGray
        ignoreButton.addSubview(ignoreButtonTitle)
        ignoreButtonTitle.text = "IGNORE"
        ignoreButtonTitle.textAlignment = .center
        ignoreButtonTitle.font = .boldSystemFont(ofSize: 12)
        ignoreButtonTitle.textColor = .white
        let gestureIgnoreTap = UITapGestureRecognizer(target: self, action: #selector(ignoreTap))
        ignoreButton.addGestureRecognizer(gestureIgnoreTap)
        
        addSubview(ignoreButton)
        ignoreButton.snp.makeConstraints{(make) in
            make.left.equalTo(15)
            make.bottom.equalTo(-30)
            make.width.equalTo(125)
            make.height.equalTo(40)
        }
        ignoreButtonTitle.snp.makeConstraints{(make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(125)
            make.height.equalTo(40)
        }
        
    }
    @objc func ignoreTap() {
        print("Ignored")
        delegate?.ignoreButtonPressed(text: "You tapped IGNORE button")
        removeFromSuperview()
    }
    
    func setupGotItButton() {
        addSubview(gotItButton)
        gotItButton.backgroundColor = .systemGreen
        gotItButton.snp.makeConstraints{(make) in
            make.right.equalTo(-15)
            make.bottom.equalTo(-30)
            make.width.equalTo(125)
            make.height.equalTo(40)
        }
        
        gotItButton.addSubview(gotItButtonTitle)
        gotItButtonTitle.text = "GOT IT"
        gotItButtonTitle.textAlignment = .center
        gotItButtonTitle.font = .boldSystemFont(ofSize: 12)
        gotItButtonTitle.textColor = .white
        gotItButtonTitle.snp.makeConstraints{(make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(125)
            make.height.equalTo(40)
        }
        
        let gestureGotItTap = UITapGestureRecognizer(target: self, action: #selector(gotItTap))
        gotItButton.addGestureRecognizer(gestureGotItTap)
    }
    @objc func gotItTap() {
        print("Got it")
        delegate?.gotItButtonPressed(color: UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        ), text: "You tapped GOT IT button")
        removeFromSuperview()
    }
}
