//
//  CustomRadioButton.swift
//  RadioButtonApp
//
//  Created by Taciano Maximo dos Santos on 19/11/22.
//

import UIKit

class CustomRadioButton: UIView {
    
    private var action: ((Int) -> Void)?
    
    lazy var radioButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        button.setImage(UIImage(systemName: "circle")!, for: .normal)
        button.setImage(UIImage(systemName: "circle.inset.filled")!, for: .selected)
        button.addTarget(self, action: #selector(toggleCheckboxSelection(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var radioButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .red
        label.textAlignment = .left
        let radioButtonLabelGesture = UITapGestureRecognizer(target: self, action: #selector(toggleCheckboxSelectionLabel))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(radioButtonLabelGesture)
        return label
    }()
    
    private lazy var radioButtonFormStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(radioButton)
        stack.addArrangedSubview(radioButtonLabel)
        return stack
    }()
    
    var secondaryColor: UIColor
    
    init(text: String, color: UIColor = .blue, action: ((Int) -> Void)?) {
        self.action = action
        secondaryColor = color
        super.init(frame: .zero)
        self.radioButtonLabel.text = text
        setupConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toggleCheckboxSelection(sender: UIButton) {
        action?(sender.tag)
        radioButton.tintColor = radioButton.isSelected ? .red : secondaryColor
        radioButtonLabel.textColor = radioButton.isSelected ? .red : secondaryColor
        radioButton.isSelected = !radioButton.isSelected
    }
    
    @objc func toggleCheckboxSelectionLabel() {
        action?(radioButton.tag)
        radioButton.tintColor = radioButton.isSelected ? .red : secondaryColor
        radioButtonLabel.textColor = radioButton.isSelected ? .red : secondaryColor
        radioButton.isSelected = !radioButton.isSelected
    }

    func setupConstraint() {
        
        self.addSubview(radioButtonFormStack)
        
        NSLayoutConstraint.activate([
            radioButton.widthAnchor.constraint(equalToConstant: 20),
            radioButton.heightAnchor.constraint(equalToConstant: 20),
            radioButtonFormStack.topAnchor.constraint(equalTo: self.topAnchor),
            radioButtonFormStack.leftAnchor.constraint(equalTo: self.leftAnchor),
            radioButtonFormStack.rightAnchor.constraint(equalTo: self.rightAnchor),
            radioButtonFormStack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func clearState(tag: Int, totalItens: [CustomRadioButton]) {
        for item in 0..<totalItens.count{
            if !(totalItens[item].radioButton.tag == tag) {
                totalItens[item].radioButton.isSelected = false
                totalItens[item].radioButton.tintColor =  .red
                totalItens[item].radioButtonLabel.textColor =  .red
            }
        }
    }
}

class CustomStackRadioButton: UIView {
    
    lazy var stack: UIStackView = {
        let stack =  UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    public func setup(with radioButton: [CustomRadioButton]) {
        var tag = 0
        for button in radioButton {
            button.radioButton.tag = tag
            stack.addArrangedSubview(button)
            tag += 1
        }
        setupStack()
    }

    private func setupStack() {
        self.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.leftAnchor.constraint(equalTo: self.leftAnchor),
            stack.rightAnchor.constraint(equalTo: self.rightAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
