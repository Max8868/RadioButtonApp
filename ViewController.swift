//
//  ViewController.swift
//  RadioButtonApp
//
//  Created by Taciano Maximo dos Santos on 19/11/22.
//

import UIKit

class ViewController: UIViewController {

    lazy var radioView1: CustomRadioButton = {
        let view = CustomRadioButton(text: "radio button 1", color: .gray) { tag in
            self.action(tag)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var radioView2: CustomRadioButton = {
        let view = CustomRadioButton(text: "radio button 2", color: .green) { tag in
            self.action(tag)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var radioView3: CustomRadioButton = {
        let view = CustomRadioButton(text: "radio button 3", color: .cyan) { tag in
            self.action(tag)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var radioView4: CustomRadioButton = {
        let view = CustomRadioButton(text: "radio button 4", color: .brown) { tag in
            self.action(tag)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var radioView5: CustomRadioButton = {
        let view = CustomRadioButton(text: "radio button 5", color: .orange) { tag in
            self.action(tag)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var radioView6: CustomRadioButton = {
        let view = CustomRadioButton(text: "radio button 6", color: .purple) { tag in
            self.action(tag)
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var array: [CustomRadioButton] = []
    
    lazy var stackRadioButton: CustomStackRadioButton = {
        let stack = CustomStackRadioButton()
        stack.translatesAutoresizingMaskIntoConstraints = false
        array.append(radioView1)
        array.append(radioView2)
        array.append(radioView3)
        array.append(radioView4)
        array.append(radioView5)
        array.append(radioView6)
        stack.setup(with: array)
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(stackRadioButton)
        NSLayoutConstraint.activate([
            stackRadioButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackRadioButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackRadioButton.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func action(_ tag: Int) {
        for itemArray in array {
            itemArray.clearState(tag: tag, totalItens: array)
        }
    }
    
}

