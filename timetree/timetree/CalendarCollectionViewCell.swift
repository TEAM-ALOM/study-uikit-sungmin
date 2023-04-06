//
//  CalendarCollectionViewCell.swift
//  timetree
//
//  Created by 조성민 on 2023/04/06.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    static let identifier = "CalendarCollectionViewCell"
    private lazy var dayLabel = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configure()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    private func configure() {
        self.addSubview(self.dayLabel)
        self.dayLabel.text = "0"
        self.dayLabel.textAlignment = .center
        self.dayLabel.font = .boldSystemFont(ofSize: 12)
        self.dayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.dayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
}

