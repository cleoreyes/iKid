//
//  ImageJokeViewController.swift
//  iKid
//
//  Created by Cleo Reyes on 4/28/25.
//

import UIKit

class ImageJokeViewController: UIViewController {
    
    @IBOutlet weak var jokeImageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    let questionImages = ["answer"]
    let answerImages = ["joke"]
    
    var currentJokeIndex = 0
    var isShowingAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        jokeImageView.contentMode = .scaleAspectFit
        
        nextButton.setTitle("Next", for: .normal)
        
        updateJokeDisplay()
    }
    
    private func updateJokeDisplay() {
        if isShowingAnswer {
            jokeImageView.image = UIImage(named: answerImages[currentJokeIndex])
        } else {
            jokeImageView.image = UIImage(named: questionImages[currentJokeIndex])
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if isShowingAnswer {
            currentJokeIndex = (currentJokeIndex + 1) % questionImages.count
            isShowingAnswer = false
        } else {
            isShowingAnswer = true
        }
        
        UIView.transition(with: jokeImageView, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.updateJokeDisplay()
        }, completion: nil)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
        }, completion: nil)
    }
}
