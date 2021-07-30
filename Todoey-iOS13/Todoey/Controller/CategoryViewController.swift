//
//  CategoryViewController.swift
//  Todoey
//
//  Created by KKANG on 2021/07/30.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Categorys.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var categoryArray: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategories()
    }

    // MARK: - DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name

        return cell
    }

    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? TodoListViewController

        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC!.selectedCategory = categoryArray[indexPath.row]
        }
    }

    // MARK: - Add new Category
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todoey Catoegory", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Category", style: .default) { (_) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!

            self.categoryArray.append(newCategory)
            self.saveItems()
        }

        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }

        alert.addAction(action)

        self.present(alert, animated: true) {
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController))
                alert.view.superview?.subviews[0].addGestureRecognizer(tapGesture)
        }

//        present(alert, animated: true, completion: nil)
    }

    @objc func dismissAlertController() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Save Items
    func saveItems() {
        do {
            try context.save()
        } catch {
            print("error saving context \(error)")
        }

        tableView.reloadData()
    }

    // CRUD: Read
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            let data = try context.fetch(request)
            categoryArray = data
        } catch {
            print("error fetching data from context \(error)")
        }

        tableView.reloadData()
    }

}
