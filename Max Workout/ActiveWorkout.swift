//
//  ActiveWorkout.swift
//  Max Workout
//
//  Created by Max Bartlik on 1/13/20.
//  Copyright © 2020 Max Bartlik. All rights reserved.
//

import Foundation
import UIKit

class ActiveWorkout: UIViewController {
    var exerciseNames: [String] = []
    var exerciseTimes: [Double] = []
    
    var timer: Timer?
    var timeLeft = 60.0
    
    var time = UILabel()
    var exerciseName = UILabel()
    
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        runWorkout()
    }
    
    
    func runWorkout() {
        timeLeft = exerciseTimes[count]
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
    }
    
    @objc
    func onTimerFires() {
        showExerciseName()
        print("Firing")
        showTime(currentTime: timeLeft)
        timeLeft -= 0.1
        print(timeLeft)
        if timeLeft < 0 {
            timer?.invalidate()
            timer = nil
            count += 1
            if count < exerciseNames.count {
                runWorkout()
            }
            else {
                finishWorkout()
            }
            
        }
    }
    
    func showExerciseName() {
        view.addSubview(exerciseName)
        exerciseName.text = exerciseNames[count]
        if exerciseName.text == "Get Ready" {
            exerciseName.text = "Get Ready For \(exerciseNames[count + 1])"
        }
        exerciseName.translatesAutoresizingMaskIntoConstraints = false
        
        let xAnchor = exerciseName.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let bottomAnchor = exerciseName.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        
        xAnchor.isActive = true
        bottomAnchor.isActive = true
    }
    
    func showTime(currentTime: Double) {
        view.addSubview(time)
        time.text = String(round(currentTime * 1000)/1000)
        time.translatesAutoresizingMaskIntoConstraints = false
        
        let xAnchor = time.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let topAnchor = time.topAnchor.constraint(equalTo: view.centerYAnchor)
        
        xAnchor.isActive = true
        topAnchor.isActive = true
    }
    
    
    func finishWorkout() {
        time.text = "Workout Complete"
        exerciseName.text = ""
    }
    
    
    
}
