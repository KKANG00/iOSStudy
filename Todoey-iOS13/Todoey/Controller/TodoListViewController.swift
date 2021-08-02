//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
// import CoreData
import RealmSwift

class TodoListViewController: SwipeTableViewController {

    @IBOutlet weak var search: UISearchBar!
    let realm = try! Realm()

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var itemArray: Results<Item>?
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = selectedCategory?.name ?? ""
        search.barTintColor = .white
    }

    // MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)

        if let item = itemArray?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Items Added"

        }

        return cell
    }

    // MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // CRUD: Update
        //        itemArray[indexPath.row].setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)

        // CRUD: Delete
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        // context에서 지운 후에 array에서 지워야함!

        //        itemArray[indexPath.row].done = !itemArray[indexPath.row].done

        //        saveItems()

        if let item = itemArray?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
//                    realm.delete(item)
                }
            } catch {
                print(error)
            }
        }

        tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Delete Item

    override func updateModel(at indexPath: IndexPath) {
        if let item = itemArray?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(item)
                }
            } catch {
                print(error)
            }
        }
    }

    // MARK: - Add New Items

    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todooey Item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { (_) in

            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print(error)
                }
            }

            self.tableView.reloadData()
        }

        // CRUD: Create
        //            let newItem = Item(context: self.context)
        //            let newItem = Item()
        //            newItem.title = textField.text!
        //            newItem.done = false
        //            newItem.parentCategory = self.selectedCategory

        //            self.itemArray.append(newItem)

        //            self.saveItems()

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }

        alert.addAction(action)

        self.present(alert, animated: true) {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
            alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }
    }

    //        present(alert, animated: true, completion: nil)

    @objc func dismissAlertController() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Save Items
    //    func saveItems() {
    //        do {
    //            try context.save()
    //        } catch {
    //            print("error saving context \(error)")
    //        }
    //
    //        tableView.reloadData()
    // }

    // CRUD: Read
    //    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), _ predicate: NSPredicate? = nil) {
    //        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
    //
    //        if let defaultPredicate = predicate {
    //            let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, defaultPredicate])
    //            request.predicate = compoundPredicate
    //        } else {
    //            request.predicate = categoryPredicate
    //        }
    //
    //        do {
    //            let data = try context.fetch(request)
    //            itemArray = data
    //        } catch {
    //            print("error fetching data from context \(error)")
    //        }
    //
    //        tableView.reloadData()
    //    }

    func loadItems() {
        itemArray = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
    }
}

// MARK: - SearchBar Methods
extension TodoListViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            loadItems()

            if searchText == "" {
                DispatchQueue.main.async {
                    searchBar.resignFirstResponder()
                }

            } else {
//                let request: NSFetchRequest<Item> = Item.fetchRequest()
//                request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//                loadItems(with: request, NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!))
                itemArray = itemArray?.filter( "title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
//                print(searchBar.text!, itemArray)

            }

            tableView.reloadData()
        }
}
