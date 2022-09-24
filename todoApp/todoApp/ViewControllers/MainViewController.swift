//
//  ViewController.swift
//  todoApp
//
//  Created by Никита Хорошко on 16.09.22.
//

import UIKit
import CoreData

class MainViewController: UIViewController{
    
    var tasks: [ToDoTask] = []
    
    let tasksTableView: UITableView = {
        let tasksTableView = UITableView()
        tasksTableView.separatorStyle = .none
        tasksTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: "TaskTableViewCell")
        tasksTableView.rowHeight = 80
        tasksTableView.translatesAutoresizingMaskIntoConstraints = false
        return tasksTableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let context = getContext()
        let fetchRequest: NSFetchRequest<ToDoTask> = ToDoTask.fetchRequest()
        do {
            try tasks = context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupViewConstraints()
    }
}


extension MainViewController {
    
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
    
    @objc func addTask() {
        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "ToDoTask", in: context) else { return }
        let taskObject = ToDoTask(entity: entity, insertInto: context)
        let vc = AddTaskViewController()
        vc.newTask = taskObject
        vc.addFunc = {(task : ToDoTask) in
            self.tasks.append(task)
            self.tasksTableView.reloadData()
            do {
                try context.save()
            } catch let error as NSError {
                print (error.localizedDescription)
            }
        }
        present(vc, animated: true)
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        let readTask = tasks[indexPath.row]
        cell.task = Task(taskFromdata: readTask)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = getContext()
            let fetchRequest: NSFetchRequest<ToDoTask> = ToDoTask.fetchRequest()
            if let results = try? context.fetch(fetchRequest) {
                for task in results {
                    if task === tasks[indexPath.row] {
                        context.delete(task)
                        do {
                            try context.save()
                        } catch let error as NSError {
                            print (error.localizedDescription)
                        }
                    }
                }
            }
            tasks.remove(at: indexPath.row)
            tasksTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

