//
//  ViewController.swift
//  GradientSquare
//
//  Created by mariya.shabanova on 03.11.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var squareView: UIView!
    
    private let shadowLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView.layer.cornerRadius = 10
        
        setGradient()
        addShadow()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        shadowLayer.frame = squareView.frame
        shadowLayer.shadowPath = UIBezierPath(roundedRect: shadowLayer.bounds, cornerRadius: shadowLayer.cornerRadius).cgPath
    }

    private func setGradient() {
        squareView.layer.masksToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = squareView.bounds
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        squareView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func addShadow() {
        shadowLayer.cornerRadius = squareView.layer.cornerRadius
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowOffset = CGSize(width: 5, height: 5)
        shadowLayer.shadowRadius = 10
        shadowLayer.backgroundColor = UIColor.clear.cgColor
        
        view.layer.insertSublayer(shadowLayer, below: squareView.layer)
    }
}
