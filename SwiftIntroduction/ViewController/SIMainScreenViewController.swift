//
//  SIMainScreenViewController.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/16/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

enum SIMenuCellType {
    case Default, DropDown
}


class SIMainScreenViewController: SIBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let SINumbersOfRows: Int = 2
    let SITempConstValue: Int
    let tableData: [(title: String, type: SIMenuCellType)]
    //let tableData2: Array<(String, SIMenuCellType)>
    
    var selectedRowIndex: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        SITempConstValue = 2
        self.tableData = [(title: "Figures Example", type: SIMenuCellType.Default), //descriptive
                          ("tests", SIMenuCellType.DropDown)] //shorthand
        
        SIMainScreenViewController.overridebleTypeMethod()

        super.init(coder: aDecoder)
    }
    
    override class func overridebleTypeMethod() -> Int {
        super.overridebleTypeMethod()
        return 7
    }
    
// MARK: - lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTableView()
        
        // FIXME: kostul' description message
        // some kostul'
    }
    
// MARK: - configuration
    
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
// MARK: - TableView dataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(UITableViewCell.si_defaultReuseIdentifier(), forIndexPath: indexPath) as! UITableViewCell
        
        let cellData = self.tableData[indexPath.row]
        cell.textLabel?.text = cellData.title
        
        let labelTextColor: UIColor
        let accessoryType: UITableViewCellAccessoryType
        
        switch cellData.type {
        case .Default :
            labelTextColor = UIColor.blackColor()
            accessoryType = UITableViewCellAccessoryType.None
        case .DropDown :
            labelTextColor = UIColor.lightGrayColor()
            accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        
        cell.textLabel?.textColor = labelTextColor
        cell.accessoryType = accessoryType
        
        return cell;
    }
    
// MARK: - TableView delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        self.selectedRowIndex = indexPath.row
        self.performSegueWithIdentifier(SISegueMainToFiguresExample, sender: nil)
    }
    
//MARK - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
        case SISegueMainToFiguresExample:
            let vc = segue.destinationViewController as! SIFiguresViewController
            if (self.selectedRowIndex != nil) {
                
            }
        default: break
        }
    }
    
// MARK: - Other
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
