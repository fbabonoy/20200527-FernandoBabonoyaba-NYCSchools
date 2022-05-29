//
//  SchoolDetailView.swift
//  20200527-FernandoBanonoyaba-NYCSchools
//
//  Created by fernando babonoyaba on 5/28/22.
//

import UIKit

class SchoolDetailView: UIViewController {
    
    var id: String?
    var detail = [ResponseModel]()
    let network = ViewModelController()
    
    var name: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "test"
        return name
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createData()
        setUp()
        network.loadData = self
    }
    
    func setUp() {
        view.addSubview(name)
        
        let layout = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            name.leftAnchor.constraint(equalTo: layout.leftAnchor),
            name.rightAnchor.constraint(equalTo: layout.rightAnchor),
            name.topAnchor.constraint(equalTo: layout.topAnchor),
            name.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
        ])
        
    }
    
    func createData() {
        guard let idSearch = id else { return }
        network.createData(urlString: "\(NetworkURL.urlDetails)\(idSearch)")
    }

    
    func setId(id: String?) {
        self.id = id
    }
}

extension SchoolDetailView: NetworkDelegate {
    
    func dataFinished() {
        
        if network.isNotEmpty() {
            name.text = network.getName(0)
        }
        
    }
    
    
}
