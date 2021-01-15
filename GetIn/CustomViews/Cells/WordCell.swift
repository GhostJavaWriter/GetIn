//
//  WordCell.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 06.12.2020.
//

import UIKit

class WordCell: UITableViewCell {
    
    static let reuseID = "WordCell"
    let cellView = UIView()
    let wordLabel = UILabel()
    let separatorLabel = UILabel()
    let translationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        backgroundColor = .secondarySystemBackground
        //        layer.cornerRadius = 30
        //        clipsToBounds = true
        
        addSubview(cellView)
        
        cellView.layer.shadowRadius = 4
        cellView.layer.shadowOffset = CGSize(width: 1, height: 1)
        cellView.layer.shadowOpacity = 0.5
        
        cellView.addSubview(wordLabel)
        cellView.addSubview(separatorLabel)
        cellView.addSubview(translationLabel)
        
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = .systemBackground
        //        cellView.clipsToBounds = true
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        wordLabel.textAlignment = .center
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        separatorLabel.text = "-"
        separatorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        translationLabel.textAlignment = .center
        translationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            separatorLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            separatorLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
            separatorLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            separatorLabel.widthAnchor.constraint(equalToConstant: 10),
            
            wordLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            wordLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            wordLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            wordLabel.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor, constant: -20),
            
            translationLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            translationLabel.leadingAnchor.constraint(equalTo: separatorLabel.trailingAnchor, constant: 20),
            translationLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            translationLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10)
        ])
    }
}
