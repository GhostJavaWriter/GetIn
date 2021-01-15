//
//  GIEmptyStateView.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 05.12.2020.
//

import UIKit

class GIEmptyStateView: UIView {
    
    let label = UILabel()
    let view = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(message: String) {
        self.init(frame: .zero)
        label.text = message
    }
    
    func configure() {
        addSubview(label)
        backgroundColor = .systemBackground
        
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}
