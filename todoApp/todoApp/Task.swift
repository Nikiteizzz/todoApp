//
//  Task.swift
//  todoApp
//
//  Created by Никита Хорошко on 18.09.22.
//

import UIKit

class Task {
    let taskName: String
    let priority: String
    let priorityImage: UIImage
    
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
