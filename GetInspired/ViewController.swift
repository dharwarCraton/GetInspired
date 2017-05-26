//
//  ViewController.swift
//  GetInspired
//
//  Created by Farah Alam on 5/25/17.
//  Copyright © 2017 Farah Alam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var quoteCollection : [Quotes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            quoteCollection = try context.fetch(Quotes.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteCollection.count
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let quote = quoteCollection[indexPath.row]
        cell.textLabel?.text = quote.title
        cell.imageView?.image = UIImage(data: quote.image as! Data)
        return cell
    }
}

    
