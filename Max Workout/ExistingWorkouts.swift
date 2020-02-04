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
    
    //Preset workout names
    var workouts: [String] = [
        "Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8", "Workout 9", "Workout 10"
    ]
    
    //Preset workouts
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
    
    //Preset exercise times
    var exerciseTimes: [[Double]] = [
        [3,4,3,5,3,4,3,3],
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
                
    }
    
    //List of workouts to pick from
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
    
    //Sets up tableview of list of workouts
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = workouts[indexPath.row] //Picks which workout will be shown in each cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int = indexPath.row
        let displayWorkoutPage = DisplayWorkout()
        
        //Sets the variables on the next page equal to the variables on this page
        displayWorkoutPage.exerciseNames = exerciseNames[index]
        displayWorkoutPage.exerciseTimes = exerciseTimes[index]
        
        self.navigationController?.pushViewController(displayWorkoutPage, animated: true)
    }
}
