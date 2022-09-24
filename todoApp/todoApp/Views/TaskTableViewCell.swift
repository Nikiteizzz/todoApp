//
//  TableViewCell.swift
//  todoApp
//
//  Created by Никита Хорошко on 16.09.22.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    public var task: Task? {
        didSet {
            addTaskToView()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
        addSubviews()
        addViewConstraints()
    }
    
    private lazy var cellView: TasksCellView = {
        let cellView = TasksCellView()
        cellView.layer.cornerRadius = 15
        cellView.layer.borderColor = UIColor.systemBackground.cgColor
        cellView.layer.borderWidth = 4
        cellView.task = task
        cellView.translatesAutoresizingMaskIntoConstraints = false
        return cellView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemBackground
    }
    
    func addSubviews() {
        self.addSubview(cellView)
    }
    
    func addViewConstraints() {
        cellView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        cellView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95).isActive = true
    }
    
    func addTaskToView() {
        cellView.task = task
    }
    
}
