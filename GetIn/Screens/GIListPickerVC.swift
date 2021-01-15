//
//  GIListPickerVC.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 24.11.2020.
//

import UIKit

class GIListPickerVC: UIViewController {
    
    var dictionary : [ListModel]?
    private var customDict : [ListModel]?
    
    private let tableView = UITableView()
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pick Lists"
        navigationController?.navigationBar.tintColor = .systemGreen
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Finish Test", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = .systemGray2
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Test", style: .plain, target: self, action: #selector(start))
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        customDict = []
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func start() {
        
        //FIXME: check words count. If count less than 10 do not start the test
        guard let dict = customDict else { return }
        var counter = 0
        for list in dict {
            counter += list.words!.count
        }

        if counter > 9 {
            
            let vc = GIStartTestVC()
            vc.dictionary = customDict
            navigationController?.pushViewController(vc, animated: true)
            for list in dict {
                list.selected = false
            }
        } else {
            let ac = UIAlertController(title: "Add some words first", message: "You need to have at least 10 words in your lists to start test", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
        }

        
    }
    
    
    private func configureTableView() {
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension GIListPickerVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let dict = dictionary else { return 0 }
        
        return dict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let listRowAt = dictionary?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listRowAt?.title
        cell.tintColor = .black
        
        if listRowAt?.selected == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dictionary?[indexPath.row].selected.toggle()
        
        guard let dict = dictionary else { return }
        
            if dict[indexPath.row].selected {
                customDict?.append(dict[indexPath.row])
            } else {
                customDict?.removeAll { $0.title == dict[indexPath.row].title }
            }
        
        if customDict?.count != 0 {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
        tableView.reloadData()
        
    }
}
