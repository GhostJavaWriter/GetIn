//
//  ListCell.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 05.12.2020.
//

import UIKit

class ListCell: UITableViewCell {
    
    static let reuseID = "ListCell"
    let cellView = UIView()
    let nameLabel = UILabel()
    let wordsLabel = UILabel()
    let progressLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
        selectionStyle = .none
        backgroundColor = .secondarySystemBackground
        addSubview(cellView)
        
        cellView.layer.shadowRadius = 8
        cellView.layer.shadowOffset = CGSize(width: 3, height: 3)
        cellView.layer.shadowOpacity = 0.5
        
        cellView.addSubview(nameLabel)
        cellView.addSubview(wordsLabel)
        cellView.addSubview(progressLabel)
        
        cellView.backgroundColor = .systemBackground
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius = 10
//        cellView.alpha = 0.5
        
        nameLabel.text = "Hello!"
        nameLabel.font = .boldSystemFont(ofSize: 25)
        nameLabel.numberOfLines = 0
//        nameLabel.backgroundColor = .green
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        wordsLabel.text = "Words: N"
        wordsLabel.font = .systemFont(ofSize: 16)
//        wordsLabel.backgroundColor = .green
        wordsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        progressLabel.text = "Words: N"
        progressLabel.font = .systemFont(ofSize: 16)
        progressLabel.numberOfLines = 0
        progressLabel.layer.cornerRadius = 10
        progressLabel.clipsToBounds = true
        progressLabel.textAlignment = .center
        progressLabel.backgroundColor = .systemGreen
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
        
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
            
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: padding),
            nameLabel.widthAnchor.constraint(equalToConstant: 300),
            nameLabel.bottomAnchor.constraint(equalTo: wordsLabel.topAnchor, constant: -padding),
            
            wordsLabel.heightAnchor.constraint(equalToConstant: 30),
            wordsLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            wordsLabel.widthAnchor.constraint(equalToConstant: 100),
            wordsLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -padding),
            
            progressLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -padding),
            progressLabel.heightAnchor.constraint(equalToConstant: 30),
            progressLabel.widthAnchor.constraint(equalToConstant: 110),
            progressLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -padding)
        ])
    }
}
