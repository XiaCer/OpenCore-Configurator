//
//  UEFIDriversViewController.swift
//  test
//
//  Created by Henry Brock on 6/8/19.
//  Copyright © 2019 Henry Brock. All rights reserved.
//

import Cocoa

class UEFIDriversViewController: NSViewController {
    
    var masterVC: MasterDetailsViewController?
    
    @IBOutlet weak var uefiDriverTable: NSTableView!
    @IBOutlet weak var uefiAutoBtn: NSButton!
    @IBOutlet weak var uefiConnectDrivers: NSButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        uefiAutoBtn.toolTip = "Automatically check and add entries for all UEFI drivers in EFI/OC/Drivers"
    }
    
    @IBAction func addUefiDriverBtn(_ sender: Any) {
        masterVC!.addEntryToTable(table: &uefiDriverTable, appendix: ["driver": ""])
    }
    @IBAction func remUefiDriverBtn(_ sender: Any) {
        masterVC!.removeEntryFromTable(table: &uefiDriverTable)
    }
    @IBAction func autoAddUefi(_ sender: Any) {
        if mountedESP != "" {
            let fileManager = FileManager.default
            let acpiUrl = URL(fileURLWithPath: "\(mountedESP)/EFI/OC/Drivers")
            do {
                let fileURLs = try fileManager.contentsOfDirectory(at: acpiUrl, includingPropertiesForKeys: nil)
                var filenames: [String] = [String]()
                for i in fileURLs {
                    filenames.append(i.lastPathComponent)
                }
                for file in filenames {
                    tableLookup[uefiDriverTable]!.append(["driver": file])
                }
                uefiDriverTable.reloadData()
            } catch {
                print("Error while enumerating files \(acpiUrl.path): \(error.localizedDescription)")
            }
        } else {
            masterVC!.espWarning()
        }
    }
}
