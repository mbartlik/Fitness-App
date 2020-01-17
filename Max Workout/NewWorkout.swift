//
//  newWorkoutPage.swift
//  Max Workout
//
//  Created by Max Bartlik on 12/26/19.
//  Copyright © 2019 Max Bartlik. All rights reserved.
//

import Foundation
import UIKit

class NewWorkout: UIViewController {
    
    var userExerciseNames: [[String]] = []
    var userExerciseTimes: [[Double]] = []
    var userWorkoutNames: [String] = []
    
    
    var workoutNumber: Int = 0
    var exerciseNumberInWorkout: Int = 0
    
    let exerciseNameTextField = UITextField()
    let exerciseTimeTextField = UITextField()
    let workoutNameTextField = UITextField()
    let addButton = UIButton()
    let finishButton = UIButton()
    
    let storage = Storage()
   
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addExerciseNameTextField()
        addExerciseTimeTextField()
        addAddButton()
        addFinishButton()
        addWorkoutNameTextField()
        
        updateVariables()
                
    }
    
    func updateVariables() {
        userExerciseNames = storage.userExerciseNames
        userExerciseTimes = storage.userExerciseTimes
        userWorkoutNames = storage.userWorkoutNames
        
        for name in userWorkoutNames {
            print(name)
        }
        print("TESTING")
        for name in storage.userWorkoutNames {
            print("storage \(name)")
        }
        
        workoutNumber = userWorkoutNames.count
        userExerciseNames.append([])
        userExerciseTimes.append([])
        
        
        
        
    }
    
    func addExerciseNameTextField() {
        view.addSubview(exerciseNameTextField)
        exerciseNameTextField.placeholder = "Enter Exercise Name"
        exerciseNameTextField.borderStyle = .roundedRect
        exerciseNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let xAnchor = exerciseNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70)
        let yAnchor = exerciseNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250)
        
        xAnchor.isActive = true
        yAnchor.isActive = true
        
    }
    
    func addExerciseTimeTextField() {
        view.addSubview(exerciseTimeTextField)
        exerciseTimeTextField.placeholder = "Enter Exercise Time"
        exerciseTimeTextField.borderStyle = .roundedRect
        exerciseTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let xAnchor = exerciseTimeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70)
        let yAnchor = exerciseTimeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
        
        xAnchor.isActive = true
        yAnchor.isActive = true
    }
    
    func addAddButton() {
        view.addSubview(addButton)
        addButton.backgroundColor = .blue
        addButton.setTitle("Add Exercise", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false

        let rightAnchor = addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        let yAnchor = addButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -225)

        rightAnchor.isActive = true
        yAnchor.isActive = true


    }
    @objc
    func addButtonPressed() {
        print("Add button pressed")
        userExerciseNames[workoutNumber].append("Get Ready")
        userExerciseTimes[workoutNumber].append(3.0)
        userExerciseNames[workoutNumber].append(exerciseNameTextField.text ?? "Blank")
        userExerciseTimes[workoutNumber].append(Double(exerciseTimeTextField.text ?? "10")!)
        exerciseNameTextField.text = ""
        exerciseTimeTextField.text = ""
        
    }
    
    func addWorkoutNameTextField() {
        view.addSubview(workoutNameTextField)
        workoutNameTextField.translatesAutoresizingMaskIntoConstraints = false
        workoutNameTextField.placeholder = "Enter Workout Name"
        workoutNameTextField.borderStyle = .roundedRect
        
        let xAnchor = workoutNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let bottomAnchor = workoutNameTextField.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: -25)
        
        xAnchor.isActive = true
        bottomAnchor.isActive = true
    
    }
    
    
    func addFinishButton() {
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        
        finishButton.backgroundColor = .blue
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(.white, for: .normal)
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
        
        let xAnchor = finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yAnchor = finishButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        
        xAnchor.isActive = true
        yAnchor.isActive = true
        
    }
    @objc
    func finishButtonPressed() {
        print("Finish button pressed")

        let userWorkoutsPage = UserWorkouts()
        userWorkoutsPage.exerciseNames = userExerciseNames
        userWorkoutsPage.exerciseTimes = userExerciseTimes
        storage.userExerciseNames = userExerciseNames
        storage.userExerciseTimes = userExerciseTimes
        
        userWorkoutNames.append(workoutNameTextField.text ?? "Workout \(workoutNumber)")
        workoutNameTextField.text = ""
        userWorkoutsPage.workouts = userWorkoutNames
        storage.userWorkoutNames = userWorkoutNames

        self.navigationController?.pushViewController(userWorkoutsPage, animated: true)
    }
    
//    func makeCustomBackButton() {
//        self.navigationItem.hidesBackButton = true
//        var backButton = UIButton()
//        backButton.setTitle("Back", for: .normal)
//        backButton.setTitleColor(.blue, for: .normal)
//        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
//        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
//    }
//    
//    
//    @objc
//    func backButtonPressed() {
//        let homePage = ViewController()
//        
//        homePage.userExerciseNames = userExerciseNames
//        homePage.userExerciseTimes = userExerciseTimes
//        homePage.userWorkoutNames = userWorkoutNames
//        
//        self.navigationController?.pushViewController(homePage, animated: false)
//        
//    }
    
    
    
}
