//
//  SchoolTitleCell.swift
//  20200527-FernandoBanonoyaba-NYCSchools
//
//  Created by fernando babonoyaba on 5/28/22.
//

import UIKit

class SchoolTitleCell: UITableViewCell {
    
    static let id = "schoolname"

    var lable: UILabel = {
        //title
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "test title"
        lable.textColor = .black
        lable.numberOfLines = 0
        return lable
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        setUp()
        
    }
    
    func setUp() {
        contentView.addSubview(lable)
        
        let layout = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            lable.leftAnchor.constraint(equalTo: layout.leftAnchor, constant: 20),
            lable.rightAnchor.constraint(equalTo: layout.rightAnchor, constant: -20),
            lable.topAnchor.constraint(equalTo: layout.topAnchor),
            lable.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
        ])
        
    }

}
