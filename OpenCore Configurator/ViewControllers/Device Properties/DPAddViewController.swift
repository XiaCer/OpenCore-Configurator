//
//  DPAddViewController.swift
//  test
//
//  Created by Henry Brock on 6/8/19.
//  Copyright © 2019 Henry Brock. All rights reserved.
//

import Cocoa

class DPAddViewController: NSViewController {
    
    var masterVC: MasterDetailsViewController?
    
    @IBOutlet weak var deviceAddTable: NSTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBAction func addDeviceAddBtn(_ sender: Any) {
        masterVC!.addEntryToTable(table: &deviceAddTable, appendix: ["device": "", "property": "", "value": "", "edit": ""])
    }
    
    @IBAction func remDeviceAddBtn(_ sender: Any) {
        masterVC!.removeEntryFromTable(table: &deviceAddTable)
    }
}
