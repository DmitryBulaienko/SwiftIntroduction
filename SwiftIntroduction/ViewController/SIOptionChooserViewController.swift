//
//  SIOptionChooserViewController.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/17/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

class SIOptionChooserViewController: SIBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let options = ["option 1", "option 2", "option 3"]
    
    var selectedOption: String?
    var optionSelectedCallback: (String -> Void)?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTableView()
        if self.selectedOption != nil {
            let index = find(self.options, self.selectedOption!)
            //self.options.indexOf(self.selectedOption!) //swift 2.0
            if (index != nil) {
                let selectedIndexPath = NSIndexPath(forRow: index!, inSection: 0)
                self.tableView.selectRowAtIndexPath(selectedIndexPath, animated: true, scrollPosition: UITableViewScrollPosition.Middle)
                self.updateCellSelectedState(selectedIndexPath, selected: true)
            }
        }
    }
    
    deinit {
        self.tableView.dataSource = nil
        self.tableView.delegate = nil
    }
    
// MARK: - tableViw configuration
    
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
// MARK: - tableView datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(UITableViewCell.si_defaultReuseIdentifier(), forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.options[indexPath.row]

        return cell
    }
    
// MARK: - tableView delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedOption = self.options[indexPath.row]
        self.updateCellSelectedState(indexPath, selected: true)
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.updateCellSelectedState(indexPath, selected: false)
    }
    
    private func updateCellSelectedState(cellIndexPath: NSIndexPath, selected :Bool) {
        let cell = self.tableView.cellForRowAtIndexPath(cellIndexPath)
        cell?.accessoryType = selected ? UITableViewCellAccessoryType.Checkmark : UITableViewCellAccessoryType.None
    }
    
// MARK: - Actions
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        if self.optionSelectedCallback != nil && self.selectedOption != nil {
            self.optionSelectedCallback!(self.selectedOption!)
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
