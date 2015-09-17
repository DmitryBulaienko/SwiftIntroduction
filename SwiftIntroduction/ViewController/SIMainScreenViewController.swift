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
    var tableData: [(title: String, type: SIMenuCellType, segue: String?)]
    //let tableData2: Array<(String, SIMenuCellType, String?)>
    
    var selectedRowIndex: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    required init(coder aDecoder: NSCoder) {
        SITempConstValue = 2
        SIMainScreenViewController.overridebleTypeMethod()
        self.tableData = [(title: "Figures Example", type: SIMenuCellType.Default, segue: SISegueMainToFiguresExample), //descriptive
            ("Choose an option", SIMenuCellType.DropDown, SISegueMainToOptionsChooser)] //shorthand

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
    
    deinit {
        self.tableView.dataSource = nil
        self.tableView.delegate = nil
    }
    
// MARK: - configuration
    
    private func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
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
        let cellData = self.tableData[indexPath.row]
        self.performSegueWithIdentifier(cellData.segue, sender: nil)
        println("selected at index \(self.selectedRowIndex) ")
    }
    
//MARK - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier! {
        case SISegueMainToOptionsChooser:
            let optionsVC = segue.destinationViewController as! SIOptionChooserViewController
            if self.selectedRowIndex != nil {
                optionsVC.selectedOption = self.tableData[self.selectedRowIndex!].title
            }
            
            optionsVC.optionSelectedCallback = {[weak self] (option: String) in
                if let strongSelf = self {
                    if strongSelf.selectedRowIndex != nil {
                        strongSelf.updateSelectedRowWithOption(option)
                    }
                }
            }
        default: break
        }
    }
    
    private func updateSelectedRowWithOption(option :String) {
        let index = self.selectedRowIndex!;
        self.tableData[index].title = option
        
        let selectedIndexPath = NSIndexPath(forRow: self.selectedRowIndex!, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
// MARK: - Other
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
