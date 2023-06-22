//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var choosenAnimalLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    
    var receivedAnswers: [Answer] = []
    var animalCounts = [Animal: Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        countAllAnimals()
        countMostCommonAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

private extension ResultViewController {
    func countAllAnimals() {
        for answer in receivedAnswers {
            if let count = animalCounts[answer.animal] {
                animalCounts[answer.animal] = count + 1
            } else {
                animalCounts[answer.animal] = 1
            }
        }
    }
    
    func countMostCommonAnimal() {
        var mostCommonAnimal: Animal!
        var maxCount = 0
        
        for (animal, count) in animalCounts {
            if count > maxCount {
                mostCommonAnimal = animal
                maxCount = count
            }
        }
        
        choosenAnimalLabel.text = "Вы - \(mostCommonAnimal.rawValue)"
        descriptionAnimalLabel.text = mostCommonAnimal.definition
    }
}
