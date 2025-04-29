//
//  KnockKnockViewController.swift
//  iKid
//
//  Created by Cleo Reyes on 4/28/25.
//

import UIKit

class KnockKnockViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    let knockKnockJoke = [
        "Knock knock!",
        "Who's there?",
        "Interrupting cow.",
        "Interrupting cow w-",
        "MOOOOO!"
    ]
    
    var currentStep = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        nextButton.setTitle("Next", for: .normal)
        jokeLabel.text = knockKnockJoke[currentStep]
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentStep = (currentStep + 1) % knockKnockJoke.count
        
        UIView.transition(with: jokeLabel, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.jokeLabel.text = self.knockKnockJoke[self.currentStep]
        }, completion: nil)
        
        if currentStep == knockKnockJoke.count - 1 {
            nextButton.setTitle("Back", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
        }, completion: nil)
    }
}
