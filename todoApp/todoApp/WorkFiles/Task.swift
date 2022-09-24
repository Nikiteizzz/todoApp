//
//  Task.swift
//  todoApp
//
//  Created by Никита Хорошко on 18.09.22.
//

import UIKit

class Task {
    var taskName: String
    var priority: String
    var priorityImage: UIImage
    
    init() {
        self.taskName = ""
        self.priority = ""
        self.priorityImage = UIImage()
    }
    
    init(taskFromdata: ToDoTask) {
        self.taskName = taskFromdata.value(forKey: "title") as! String
        self.priority = taskFromdata.value(forKey: "priority") as! String
        switch self.priority {
        case "Очень важно!":
            self.priorityImage = UIImage(named: "redCircle") ?? UIImage()
        case "Ну, не так уж и важно)":
            self.priorityImage = UIImage(named: "yellowCircle") ?? UIImage()
        case "Ну, как-нибудь сделаю":
            self.priorityImage = UIImage(named: "greenCircle") ?? UIImage()
        default:
            self.priorityImage = UIImage()
            print("Error with task priority")
        }
    }
    
    init(taskName: String, priority: Priority) {
        self.taskName = taskName
        switch priority {
        case .bigPriority:
            self.priority = "Очень важно!"
            self.priorityImage = UIImage(named: "redCircle") ?? UIImage()
        case .middlePriority:
            self.priority = "Ну, не так уж и важно)"
            self.priorityImage = UIImage(named: "yellowCircle") ?? UIImage()
        case .weakPriority:
            self.priority = "Ну, как-нибудь сделаю"
            self.priorityImage = UIImage(named: "greenCircle") ?? UIImage()
        }
    }
}
