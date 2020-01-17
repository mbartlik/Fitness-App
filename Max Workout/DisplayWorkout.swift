//
//  ActiveWorkout.swift
//  Max Workout
//
//  Created by Max Bartlik on 1/13/20.
//  Copyright © 2020 Max Bartlik. All rights reserved.
//

import Foundation
import UIKit

class DisplayWorkout: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var workout: String = ""
    var exerciseNames: [String] = []
    var exerciseTimes: [Double] = []
    var tableView = UITableView()
    let beginWorkoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupBeginWorkoutButton()
        
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let topAnchor = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let leftAnchor = tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightAnchor = tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let bottomAnchor = tableView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 500)
        
        topAnchor.isActive = true
        leftAnchor.isActive = true
        rightAnchor.isActive = true
        bottomAnchor.isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseNames.count/2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "\(exerciseTimes[indexPath.row * 2 + 1])\("s ") \(exerciseNames[indexPath.row * 2 + 1])"
        

        return cell
        
    }
    
    func setupBeginWorkoutButton() {
        beginWorkoutButton.backgroundColor = .blue
        beginWorkoutButton.setTitle("Begin", for: .normal)
        beginWorkoutButton.setTitleColor(.white, for: .normal)
        beginWorkoutButton.addTarget(self, action: #selector(beginWorkoutButtonPressed), for: .touchUpInside)
        
        view.addSubview(beginWorkoutButton)
        beginWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = beginWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topConstraint = beginWorkoutButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30)
        let width = beginWorkoutButton.widthAnchor.constraint(equalToConstant: 100)
        
        xConstraint.isActive = true
        topConstraint.isActive = true
        width.isActive = true
    }
    
    @objc
    func beginWorkoutButtonPressed() {
        let activeWorkoutPage = ActiveWorkout()
        activeWorkoutPage.exerciseTimes = exerciseTimes
        activeWorkoutPage.exerciseNames = exerciseNames
        self.navigationController?.pushViewController(activeWorkoutPage, animated: true)
    }
    
    
    

}
