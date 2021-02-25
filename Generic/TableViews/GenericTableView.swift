//
//  GenericTableView.swift
//  Generic
//
//  Created by Justyna Kowalkowska on 25/02/2021.
//

import UIKit

final class GenericTableView<Item, Cell: UITableViewCell>: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    
    private let reuseID = "CELL"
    
    private var items: [Item]
    private var config: (Item, Cell) -> Void
    private var selectorHandler: (Item) -> Void
    
    //MARK: - Initializer
    
    init(items: [Item],
         config: @escaping(Item, Cell) -> Void,
         selectorHandler: @escaping(Item) -> Void
    ){
        self.items = items
        self.config = config
        self.selectorHandler = selectorHandler
        
        super.init(frame: .zero, style: .plain)
        self.delegate = self
        self.dataSource = self
        self.register(Cell.self, forCellReuseIdentifier: reuseID)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - UITableViewDelegate and UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        
        config(items[indexPath.row], cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectorHandler(items[indexPath.row])
    }
}

//MARK: - Reload Data

extension GenericTableView {
    func reload(data items: [Item]) {
        self.items = items
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
