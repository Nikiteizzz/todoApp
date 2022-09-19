//
//  AddTaskViewController.swift
//  todoApp
//
//  Created by Никита Хорошко on 19.09.22.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var newTask: Task?
    var addFunc: ((Task) -> Void)?
    
    private let taskNameTextField: UITextField = {
       let taskNameTextField = UITextField()
        taskNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: taskNameTextField.frame.height))
        taskNameTextField.leftViewMode = .always
        taskNameTextField.clearButtonMode = .whileEditing
        taskNameTextField.placeholder = "Задача"
        taskNameTextField.layer.cornerRadius = 10
        taskNameTextField.backgroundColor = .oppositeToSystemColorGray
        taskNameTextField.translatesAutoresizingMaskIntoConstraints = false
        return taskNameTextField
    }()
    
    private let taskPriorityControl: UISegmentedControl = {
        let taskPriorityControl = UISegmentedControl()
        taskPriorityControl.insertSegment(withTitle: "Очень важно", at: 0, animated: true)
        taskPriorityControl.insertSegment(withTitle: "Важно", at: 1, animated: true)
        taskPriorityControl.insertSegment(withTitle: "Не горит", at: 2, animated: true)
        taskPriorityControl.backgroundColor = .systemBackground
        taskPriorityControl.translatesAutoresizingMaskIntoConstraints = false
        return taskPriorityControl
    }()
    
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(UIColor.oppositeToSystemColor, for: .normal)
        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        addButton.backgroundColor = UIColor.oppositeToSystemColorGray
        addButton.layer.cornerRadius = 15
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        addViewConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func addSubviews() {
        view.addSubview(taskPriorityControl)
        view.addSubview(taskNameTextField)
        view.addSubview(addButton)
    }
    
    func addViewConstraints() {
        taskNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        taskNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taskNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        taskNameTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        taskPriorityControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taskPriorityControl.topAnchor.constraint(equalTo: taskNameTextField.bottomAnchor, constant: 50).isActive = true
        taskPriorityControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        taskPriorityControl.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: taskPriorityControl.bottomAnchor, constant: 50).isActive = true
        addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
    }
    
    @objc func addTask() {
        if taskNameTextField.text != nil && taskPriorityControl.selectedSegmentIndex != -1 {
            switch taskPriorityControl.selectedSegmentIndex {
            case 0: newTask = Task(taskName: taskNameTextField.text!, priority: .bigPriority)
            case 1: newTask = Task(taskName: taskNameTextField.text!, priority: .middlePriority)
            case 2: newTask = Task(taskName: taskNameTextField.text!, priority: .weakPriority)
            default: print("Что-то пошло не по плану")
            }
            addFunc?(newTask ?? Task())
            let successAlert = UIAlertController(title: "Успешно!", message: "Задача была добавлена", preferredStyle: .alert)
            let successAlertAction = UIAlertAction(title: "Окей", style: .default) { _ in self.dismiss(animated: true) }
            successAlert.addAction(successAlertAction)
            present(successAlert, animated: true)
        } else {
            let failAlert = UIAlertController(title: "Ошибка", message: "Заполнены не все поля", preferredStyle: .alert)
            failAlert.addAction(UIAlertAction(title: "Окей", style: .default))
            present(failAlert, animated: true)
        }
    }
}
