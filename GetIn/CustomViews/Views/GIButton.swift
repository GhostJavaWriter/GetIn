//
//  GIButton.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 06.12.2020.
//

import UIKit

class GIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }

    func configure() {
        layer.cornerRadius = 10
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowOpacity = 0.5
        setTitleColor(.white, for: .normal)
        setTitleColor(.gray, for: .selected)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
