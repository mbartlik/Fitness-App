//
//  ExistingWorkouts.swift
//  Max Workout
//
//  Created by Max Bartlik on 12/26/19.
//  Copyright © 2019 Max Bartlik. All rights reserved.
//

import Foundation
import UIKit

class ExistingWorkouts: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView
    
    let workoutTextField = UITextField()
    
    let goToWorkoutButton = UIButton()
    
    var workouts: [String] = [
        "Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8", "Workout 9", "Workout 10"
    ]
    

    var exerciseNames: [[String]] = [
        ["Get Ready","Plank", "Get Ready", "V-Sit", "Get Ready", "15 Pushups", "Get Ready", "Plank"],
        ["Get Ready","30 Pushups", "Get Ready", "20 Situps", "Get Ready", "Plank", "Get Ready", "10 Pushups"],
        ["Get Ready","Plank", "Get Ready", "10 Pushups", "Get Ready", "Bicycle legs", "Get Ready", "Plank"],
        ["Blank"],
        ["Blank"],
        ["Blank"],
        ["Blank"],
        ["Blank"],
        ["Blank"],
        ["Blank"],
    ]

    var exerciseTimes: [[Double]] = [
        [3,6,3,5,3,4,3,3],
        [3,80,3,45,3,45,3,30],
        [3,90,3,30,3,30,3,45],
        [30],
        [30],
        [30],
        [30],
        [30],
        [30],
        [30],
    
    
    ]
    
    
    
    init() {
        tableView = UITableView()
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupWorkoutsList()
//        setupWorkoutTextField()
//        setupGoToWorkoutButton()
                
    }
    
    func setupWorkoutsList() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let leftConstraint = tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300)
        
        topConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
        bottomConstraint.isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = workouts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int = indexPath.row
        let displayWorkoutPage = DisplayWorkout()
        displayWorkoutPage.exerciseNames = exerciseNames[index]
        displayWorkoutPage.exerciseTimes = exerciseTimes[index]
        
        self.navigationController?.pushViewController(displayWorkoutPage, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func setupWorkoutTextField() {
//        view.addSubview(workoutTextField)
//        workoutTextField.placeholder = "Enter Workout"
//        workoutTextField.borderStyle = .roundedRect
//
//        workoutTextField.translatesAutoresizingMaskIntoConstraints = false
//
//        let xConstraint = workoutTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let topConstraint = workoutTextField.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 50)
//
//        xConstraint.isActive = true
//        topConstraint.isActive = true
//
//    }
//
//    func setupGoToWorkoutButton() {
//        goToWorkoutButton.backgroundColor = .blue
//        goToWorkoutButton.setTitle("Go", for: .normal)
//        goToWorkoutButton.setTitleColor(.white, for: .normal)
//        goToWorkoutButton.addTarget(self, action: #selector(goButtonPressed), for: .touchUpInside)
//
//        view.addSubview(goToWorkoutButton)
//        goToWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
//
//        let xConstraint = goToWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let topConstraint = goToWorkoutButton.topAnchor.constraint(equalTo: workoutTextField.bottomAnchor, constant: 30)
//        let width = goToWorkoutButton.widthAnchor.constraint(equalToConstant: 100)
//
//        xConstraint.isActive = true
//        topConstraint.isActive = true
//        width.isActive = true
//    }
//
//    @objc
//    func goButtonPressed() {
//        if let workout = workoutTextField.text {
//
//            let displayWorkoutPage = DisplayWorkout()
//
//            var index: Int = 0
//            if workoutTextField.text == "Workout 1" {
//                index = 0
//            }
//            else if workoutTextField.text == "Workout 2" {
//                index = 1
//            }
//            else if workoutTextField.text == "Workout 3" {
//                index = 2
//            }
//            else if workoutTextField.text == "Workout 4" {
//                index = 3
//            }
//            else if workoutTextField.text == "Workout 5" {
//                index = 4
//            }
//            else if workoutTextField.text == "Workout 6" {
//                index = 5
//            }
//            else if workoutTextField.text == "Workout 7" {
//                index = 6
//            }
//            else if workoutTextField.text == "Workout 8" {
//                index = 7
//            }
//            else if workoutTextField.text == "Workout 9" {
//                index = 8
//            }
//            else if workoutTextField.text == "Workout 10" {
//                index = 9
//            }
//
//
//            displayWorkoutPage.workout = workoutTextField.text ?? "empty"
//            displayWorkoutPage.exerciseNames = exerciseNames[index]
//            displayWorkoutPage.exerciseTimes = exerciseTimes[index]
//
//            self.navigationController?.pushViewController(displayWorkoutPage, animated: true)
//
//        }
//    }
//
//
}
