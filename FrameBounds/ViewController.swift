//
//  ViewController.swift
//  FrameBounds
//
//  Created by 홍정아 on 2021/09/16.
//

import UIKit

class ViewController: UIViewController {
    let box = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (1...4).forEach { setupMarkers(height: $0 * 100) }
        setupBox()
        animate(mixedOrder: true)
    }
    
    func setupMarkers(height: Int) {
        let separator = UIView()
        separator.frame = CGRect(x: 0, y: height, width: Int(self.view.frame.width), height: 1)
        separator.backgroundColor = .lightGray
        self.view.addSubview(separator)
        
        let label = UILabel()
        label.text = height.description
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(height) - 50).isActive = true
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = .lightGray
    }
    
    func setupBox() {
        box.backgroundColor = .systemPink
        box.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.view.addSubview(box)
    }

    func animate(mixedOrder: Bool) {
        mixedOrder ? animateInmixedOrder() : animateInrightOrder()
    }
    
    func animateInmixedOrder() {
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            //0.5: 400 => 100
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                print("0.5  :", self.box.frame.origin.y, terminator: "   ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            //0.75: 100 => 200
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                print("0.75 :", self.box.frame.origin.y, terminator: " ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
           
            //0.0: 0 => 300
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                print("0.0  :", self.box.frame.origin.y, terminator: " ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            //0.25: 300 => 400
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                print("0.25 :", self.box.frame.origin.y, terminator: " ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            // 0 => 300 => 400 => 100 => 200
        }) { _ in
            print("-------------\n종료시 box 위치: ", self.box.frame.origin.y)
        }
    }
    
    func animateInrightOrder() {
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: [], animations: {
            //0.0: 0 => 100
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                print("0.0  :", self.box.frame.origin.y, terminator: "   ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            //0.25: 100 => 200
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                print("0.25 :", self.box.frame.origin.y, terminator: " ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            //0.5: 200 => 300
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                print("0.5  :", self.box.frame.origin.y, terminator: " ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            //0.75: 300 => 400
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                print("0.75 :", self.box.frame.origin.y, terminator: " ")
                self.box.frame.origin.y += 100
                print(self.box.frame.origin.y)
            }
            
            // 0 => 300 => 400 => 100 => 200
        }) { _ in
            print("-------------\n종료시 box 위치: ", self.box.frame.origin.y)
        }
    }
}

