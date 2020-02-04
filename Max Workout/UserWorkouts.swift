//
//  UserWorkouts.swift
//  Max Workout
//
//  Created by Max Bartlik on 1/14/20.
//  Copyright © 2020 Max Bartlik. All rights reserved.
//

import Foundation
import UIKit

class UserWorkouts: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var exerciseNames: [[String]] = []
    var exerciseTimes: [[Double]] = []
    
    var tableView: UITableView
        
    let workoutTextField = UITextField()
    
    let goToWorkoutButton = UIButton()
    
    var workouts: [String] = []
    

    
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
        
    
    
}
