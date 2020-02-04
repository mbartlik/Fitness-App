//
//  ViewController.swift
//  Max Workout
//
//  Created by Max Bartlik on 12/26/19.
//  Copyright © 2019 Max Bartlik. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //Home screen
    
    // Sets buttons and logo for home screen
    let logo = UIImageView()
    let newWorkoutButton = UIButton()
    let existingWorkoutsButton = UIButton()
    let suggestedWorkoutsButton = UIButton()
    let settingsButton = UIButton()
    
    // Sets up arrays to store values for sequential exercises and times for each exercise
    var userExerciseNames: [[String]] = []
    var userExerciseTimes: [[Double]] = []
    var userWorkoutNames: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addLogo()
        addNewWorkoutButton()
        addExistingWorkoutsButton()
        addSuggestedWorkoutsButton()
        addSettingsButton()
        self.navigationItem.hidesBackButton = true
        
    }
    
    func addLogo() {
        logo.image = UIImage(named: "Workout-logo.png")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        let xConstraint = logo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        let width = logo.widthAnchor.constraint(equalToConstant: 250)
        
        xConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
    }
    
    func addNewWorkoutButton() {
        newWorkoutButton.backgroundColor = .blue
        newWorkoutButton.setTitle("Create New Workout", for: .normal)
        newWorkoutButton.setTitleColor(.white, for: .normal)
        
        //Links this to the page to make a new workout
        newWorkoutButton.addTarget(self, action: #selector(newWorkoutButtonPressed), for: .touchUpInside)
        
        view.addSubview(newWorkoutButton)
        newWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = newWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = newWorkoutButton.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 50)
        let width = newWorkoutButton.widthAnchor.constraint(equalToConstant: 300)
        let height = newWorkoutButton.heightAnchor.constraint(equalToConstant: 50)
        
        xConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
        height.isActive = true
        
    }
    
    @objc
    func newWorkoutButtonPressed() { //Sends to the new workout page
        print("Pressed")
        let newWorkoutPage = NewWorkout()
        self.navigationController?.pushViewController(newWorkoutPage, animated: true)
    }
    
    func addExistingWorkoutsButton() {
        existingWorkoutsButton.backgroundColor = .blue
        existingWorkoutsButton.setTitle("My Workouts", for: .normal)
        existingWorkoutsButton.setTitleColor(.white, for: .normal)
        
        //Sets up link to existing workouts page
        existingWorkoutsButton.addTarget(self, action: #selector(existingWorkoutsButtonPressed), for: .touchUpInside)
        
        view.addSubview(existingWorkoutsButton)
        existingWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = existingWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = existingWorkoutsButton.topAnchor.constraint(equalTo: newWorkoutButton.bottomAnchor, constant: 30)
        let width = existingWorkoutsButton.widthAnchor.constraint(equalToConstant: 300)
        let height = existingWorkoutsButton.heightAnchor.constraint(equalToConstant: 50)
        
        xConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
        height.isActive = true
    }
    
    @objc
    func existingWorkoutsButtonPressed() {
        print("Pressed existing workouts button")
    }
    
    
    
    func addSuggestedWorkoutsButton() {
        suggestedWorkoutsButton.backgroundColor = .blue
        suggestedWorkoutsButton.setTitle("Suggested Workouts", for: .normal)
        suggestedWorkoutsButton.setTitleColor(.white, for: .normal)
        
        //Sets up link to suggested workouts page
        suggestedWorkoutsButton.addTarget(self, action: #selector(suggestedWorkoutsButtonPressed), for: .touchUpInside)
        
        view.addSubview(suggestedWorkoutsButton)
        suggestedWorkoutsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = suggestedWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = suggestedWorkoutsButton.topAnchor.constraint(equalTo: existingWorkoutsButton.bottomAnchor, constant: 30)
        let width = suggestedWorkoutsButton.widthAnchor.constraint(equalToConstant: 300)
        let height = suggestedWorkoutsButton.heightAnchor.constraint(equalToConstant: 50)
        
        xConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
        height.isActive = true
    }
    
    @objc
    func suggestedWorkoutsButtonPressed() { //Sends to suggested workouts page
        print("Pressed suggested workouts")
        let existingWorkoutsPage = ExistingWorkouts()
        self.navigationController?.pushViewController(existingWorkoutsPage, animated: true)
    }
    
    func addSettingsButton() { //Sets up settings button
        settingsButton.backgroundColor = .blue
        settingsButton.setTitle("Settings", for: .normal)
        settingsButton.setTitleColor(.white, for: .normal)
//        newWorkoutButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        view.addSubview(settingsButton)
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = settingsButton.topAnchor.constraint(equalTo: suggestedWorkoutsButton.bottomAnchor, constant: 30)
        let width = settingsButton.widthAnchor.constraint(equalToConstant: 300)
        let height = settingsButton.heightAnchor.constraint(equalToConstant: 50)
        
        xConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
        height.isActive = true
    }

    

}

