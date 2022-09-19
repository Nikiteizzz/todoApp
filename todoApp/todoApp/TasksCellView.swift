//
//  TasksCellView.swift
//  todoApp
//
//  Created by Никита Хорошко on 18.09.22.
//

import UIKit

class TasksCellView: UIView {
    
    public var task: Task? {
        didSet {
            setupTextAndImage()
        }
    }
    
    private lazy var taskNameLabel: UILabel = {
        let taskNameLabel = UILabel()
        taskNameLabel.textColor = UIColor.oppositeToSystemColor
        taskNameLabel.textAlignment = .left
        taskNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return taskNameLabel
    }()
    
    private lazy var taskPriorityImage: UIImageView = {
        let taskPriorityImage = UIImageView()
        taskPriorityImage.translatesAutoresizingMaskIntoConstraints = false
        return taskPriorityImage
    }()
    
    private lazy var taskPriorityDescription: UILabel = {
        let taskPriorityDescription = UILabel()
        taskPriorityDescription.textColor = UIColor.oppositeToSystemColor
        taskPriorityDescription.textAlignment = .left
        taskPriorityDescription.translatesAutoresizingMaskIntoConstraints = false
        return taskPriorityDescription
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubviews()
        addViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .oppositeToSystemColorGray
    }
    
    func addSubviews() {
        addSubview(taskNameLabel)
        addSubview(taskPriorityImage)
        addSubview(taskPriorityDescription)
    }
    
    func setupTextAndImage() {
        taskNameLabel.text = task?.taskName
        taskPriorityImage.image = task?.priorityImage
        taskPriorityDescription.text = task?.priority
    }
    
    func addViewConstraints() {
        taskNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        taskNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        taskNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        taskNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        taskPriorityImage.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: -5).isActive = true
        taskPriorityImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        taskPriorityImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        taskPriorityImage.widthAnchor.constraint(equalTo: taskPriorityImage.heightAnchor).isActive = true

        taskPriorityDescription.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: -5).isActive = true
        taskPriorityDescription.leftAnchor.constraint(equalTo: taskPriorityImage.rightAnchor, constant: 10).isActive = true
        taskPriorityDescription.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        taskPriorityDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
    }
}
