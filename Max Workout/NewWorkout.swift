//
//  newWorkoutPage.swift
//  Max Workout
//
//  Created by Max Bartlik on 12/26/19.
//  Copyright © 2019 Max Bartlik. All rights reserved.
//

import Foundation
import UIKit

class NewWorkout: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Variables to store exercise data
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
    
    let workoutPreview = UITableView()
    
   
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addExerciseNameTextField()
        addExerciseTimeTextField()
        addAddButton()
        addFinishButton()
        addWorkoutNameTextField()
        
        updateVariables()
        addWorkoutPreview()
                
    }
    
    func updateVariables() { //Refreshes variables
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
    
    func addExerciseNameTextField() { //Users enter the name of an exercise here
        view.addSubview(exerciseNameTextField)
        exerciseNameTextField.placeholder = "Enter Exercise Name"
        exerciseNameTextField.borderStyle = .roundedRect
        exerciseNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let xAnchor = exerciseNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70)
        let yAnchor = exerciseNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -250)
        
        xAnchor.isActive = true
        yAnchor.isActive = true
        
    }
    
    func addExerciseTimeTextField() { //Users enter the time for a given exercise here
        view.addSubview(exerciseTimeTextField)
        exerciseTimeTextField.placeholder = "Enter Exercise Time"
        exerciseTimeTextField.borderStyle = .roundedRect
        exerciseTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let xAnchor = exerciseTimeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70)
        let yAnchor = exerciseTimeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200)
        
        xAnchor.isActive = true
        yAnchor.isActive = true
    }
    
    func addAddButton() { //User presses this button to add an exercise to the workout
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
        
        //This is added in between each exercise so there is time in between
        userExerciseNames[workoutNumber].append("Get Ready")
        userExerciseTimes[workoutNumber].append(3.0)
        
        userExerciseNames[workoutNumber].append(exerciseNameTextField.text ?? "Blank")
        userExerciseTimes[workoutNumber].append(Double(exerciseTimeTextField.text ?? "10")!)
        exerciseNameTextField.text = ""
        exerciseTimeTextField.text = ""
        
//        workoutPreview.beginUpdates()
//        workoutPreview.insertRows(at: [IndexPath(row: userExerciseNames[workoutNumber].count-1, section: 0)], with: .automatic)
//        workoutPreview.endUpdates()
        workoutPreview.reloadData()
        
    }
    
    func addWorkoutPreview() { //This is a tableview to display the workout as created so far
        view.addSubview(workoutPreview)
        workoutPreview.translatesAutoresizingMaskIntoConstraints = false
        
        let leftAnchor = workoutPreview.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        let rightAnchor = workoutPreview.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50)
        let topAnchor = workoutPreview.topAnchor.constraint(equalTo: exerciseTimeTextField.bottomAnchor, constant: 100)
        let bottomAnchor = workoutPreview.bottomAnchor.constraint(equalTo: workoutNameTextField.topAnchor, constant: -100)
        
        leftAnchor.isActive = true
        rightAnchor.isActive = true
        topAnchor.isActive = true
        bottomAnchor.isActive = true
        
        workoutPreview.delegate = self
        workoutPreview.dataSource = self
        
    }
    
    
    //Sets up tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userExerciseNames[workoutNumber].count/2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let index = indexPath.row*2+1
        cell.textLabel?.text = "\(userExerciseTimes[workoutNumber][index])\("s ") \(userExerciseNames[workoutNumber][index])"
        
        return cell
    }
    
    
    func addWorkoutNameTextField() { //User enters the name of the workout here
        view.addSubview(workoutNameTextField)
        workoutNameTextField.translatesAutoresizingMaskIntoConstraints = false
        workoutNameTextField.placeholder = "Enter Workout Name"
        workoutNameTextField.borderStyle = .roundedRect
        
        let xAnchor = workoutNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let bottomAnchor = workoutNameTextField.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: -25)
        
        xAnchor.isActive = true
        bottomAnchor.isActive = true
    
    }
    
    
    func addFinishButton() { //User presses to finish making the new workout
        view.addSubview(finishButton)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        
        finishButton.backgroundColor = .blue
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(.white, for: .normal)
        
        //Sets up link to the next page
        finishButton.addTarget(self, action: #selector(finishButtonPressed), for: .touchUpInside)
        
        let xAnchor = finishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let yAnchor = finishButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        
        xAnchor.isActive = true
        yAnchor.isActive = true
        
    }
    @objc
    func finishButtonPressed() {
        print("Finish button pressed")

        //Stores variables
        let userWorkoutsPage = UserWorkouts()
        userWorkoutsPage.exerciseNames = userExerciseNames
        userWorkoutsPage.exerciseTimes = userExerciseTimes
        storage.userExerciseNames = userExerciseNames
        storage.userExerciseTimes = userExerciseTimes
        
        userWorkoutNames.append(workoutNameTextField.text ?? "Workout \(workoutNumber)")
        workoutNameTextField.text = ""
        userWorkoutsPage.workouts = userWorkoutNames
        storage.userWorkoutNames = userWorkoutNames

        self.navigationController?.pushViewController(userWorkoutsPage, animated: true) //Sends to the next page
    }
    
    
    
}
