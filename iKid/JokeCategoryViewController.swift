//
//  JokeCategoryViewController.swift
//  iKid
//
//  Created by Cleo Reyes on 4/28/25.
//

import UIKit

struct Joke {
    let setup: String
    let punchline: String
}

class JokeCategoryViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var jokes: [Joke] = []
    var currentJokeIndex = 0
    var isShowingPunchline = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        jokeLabel.textAlignment = .center
        nextButton.setTitle("Next", for: .normal)
        
        if let tabTitle = tabBarItem.title {
            title = tabTitle
        }
        
        updateJokeDisplay()
    }
    
    private func updateJokeDisplay() {
        if isShowingPunchline {
            switch title {
            case "Good":
                jokeLabel.text = "They didn't want Katy Perry to be the first witch in space!"
            case "Pun":
                jokeLabel.text = "Because they wanted to C#!"
            case "Dad":
                jokeLabel.text = "Nice to meet you  \"so tired of this bro\", I'm dad!"
            default:
                jokeLabel.text = "They didn't want Katy Perry to be the first witch in space!"
            }
        } else {
            switch title {
            case "Good":
                jokeLabel.text = "Why did Elphaba and Galinda want to defy gravity?"
            case "Pun":
                jokeLabel.text = "Why did Microsoft mandate all their employees to make wear glasses?"
            case "Dad":
                jokeLabel.text = "These jokes are so corny I'm so tired of this bro..."
            default:
                jokeLabel.text = "Why did Elphaba and Galinda want to defy gravity?"
            }
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if isShowingPunchline {
            isShowingPunchline = false
            nextButton.setTitle("Next", for: .normal)
        } else {
            isShowingPunchline = true
            nextButton.setTitle("Back", for: .normal)
        }
        
        UIView.transition(with: jokeLabel, duration: 0.5, options: .transitionFlipFromRight, animations: {
            self.updateJokeDisplay()
        }, completion: nil)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
        }, completion: nil)
    }
}
