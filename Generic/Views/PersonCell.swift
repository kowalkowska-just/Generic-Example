//
//  PersonCell.swift
//  Generic
//
//  Created by Justyna Kowalkowska on 25/02/2021.
//

import UIKit

final class PersonCell: UITableViewCell {
    
    //MARK: - Properties
    
    var person: Person? {
        didSet {
            if let person = person {
                nameLabel.text = person.name
                genderLabel.text = person.gender
            }
        }
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = label.font.withSize(16)
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = label.font.withSize(14)
        return label
    }()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    
    func setupView() {
        [nameLabel, genderLabel].forEach { (v) in addSubview(v) }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        //nameLabel
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        ])
        
        //genderLabel
        NSLayoutConstraint.activate([
            genderLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            genderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            genderLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}
