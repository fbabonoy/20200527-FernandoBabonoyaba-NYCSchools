//
//  ViewController.swift
//  20200527-FernandoBanonoyaba-NYCSchools
//
//  Created by fernando babonoyaba on 5/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    let network = ViewModelController()
    
    private lazy var tableOfSchools: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(SchoolTitleCell.self, forCellReuseIdentifier: SchoolTitleCell.id)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        network.createData()
        network.loadData = self

    }

    func setUp() {
        view.addSubview(tableOfSchools)
        
        tableOfSchools.rowHeight = 40
        
        let layout = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableOfSchools.leftAnchor.constraint(equalTo: layout.leftAnchor),
            tableOfSchools.rightAnchor.constraint(equalTo: layout.rightAnchor),
            tableOfSchools.topAnchor.constraint(equalTo: layout.topAnchor),
            tableOfSchools.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
        ])
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return network.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTitleCell.id, for: indexPath) as? SchoolTitleCell else { return SchoolTitleCell() }
        cell.lable.text = network.getName(indexPath.row)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = network.getID(indexPath.row) else { return }
        let detailView = SchoolDetailView()
        detailView.setId(id: id)
        present(detailView, animated: true)
    }
}

extension ViewController: NetworkDelegate {
    
    func dataFinished() {
        tableOfSchools.reloadData()
        
    }
    
}
