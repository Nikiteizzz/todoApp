//
//  ViewController.swift
//  todoApp
//
//  Created by Никита Хорошко on 16.09.22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks: [Task] = [Task(taskName: "Важно", priority: .bigPriority), Task(taskName: "Неважно", priority: .weakPriority)]
    
    let tasksTableView: UITableView = {
        let tasksTableView = UITableView()
        tasksTableView.separatorStyle = .none
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")
        tasksTableView.rowHeight = 80
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        return tasksTableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ToDo лист"
        setupView()
        addSubviews()
        setupViewConstraints()
    }

    func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "ToDo лист"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        navigationController?.navigationBar.prefersLargeTitles = true
        tasksTableView.dataSource = self
        tasksTableView.delegate = self
    }
    
    func addSubviews() {
        view.addSubview(tasksTableView)
    }
    
    func setupViewConstraints() {
        tasksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tasksTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tasksTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        tasksTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        cell.task = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tasksTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc func addTask() {
        
    }
}

