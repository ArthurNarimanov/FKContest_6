//
//  ViewController.swift
//  FKContest_6
//
//  Created by Arthur Narimanov on 3/18/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var box: UIView = {
        let view = UIView()
        view.bounds.size = .init(width: 100, height: 100)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 16
        view.layer.cornerCurve = .continuous
       return view
    }()
    
    private let tapGesture = UITapGestureRecognizer()
    private var animator: UIDynamicAnimator!

    override func loadView() {
        super.loadView()
        view.addSubview(box)
        box.center = view.center
        animator = UIDynamicAnimator(referenceView: view)
        
        view.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(handleTapGesture(_:)))
    }

    
    @objc
    private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        guard gesture.state == .ended else { return }
        animator.removeAllBehaviors()
        let snap = UISnapBehavior(item: box, snapTo: gesture.location(in: view))
        snap.damping = 0.9
        animator.addBehavior(snap)
    }
}
