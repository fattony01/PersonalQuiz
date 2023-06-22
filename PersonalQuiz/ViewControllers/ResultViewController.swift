//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов +
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    var receivedAnswers: [Answer] = []
    var animalCounts = [PersonalQuiz.Animal: Int]()


        
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
        var mostCommonAnimal: PersonalQuiz.Animal?
        var maxCount = 0

        for (animal, count) in animalCounts {
            if count > maxCount {
                mostCommonAnimal = animal
                maxCount = count
            }
        }
        
        print("Чаще всего встречается \(mostCommonAnimal)")
    }
}
