//
//  RegularTableView.swift
//  Generic
//
//  Created by Justyna Kowalkowska on 24/02/2021.
//

import UIKit

final class RegularTableView: UITableView {
    
    //MARK: - Properties
    
    private let reuseID = "CELL"
    
    private var items: [String]
    private var config: (String, UITableViewCell) -> Void
    private var selectorHandler: (String) -> Void
    
    //MARK: - Initializer
    
    init(items: [String],
         config: @escaping(String, UITableViewCell) -> Void,
         selectorHandler: @escaping(String) -> Void
    ){
        self.items = items
        self.config = config
        self.selectorHandler = selectorHandler
        
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.register(UITableViewCell.self, forCellReuseIdentifier: reuseID)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource

extension RegularTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        config(items[indexPath.row], cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectorHandler(items[indexPath.row])
    }
}

//MARK: - Reload Data 

extension RegularTableView {
    func reload(data items: [String]) {
        self.items = items
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
