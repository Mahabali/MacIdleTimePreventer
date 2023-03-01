//
//  ViewController.swift
//  SimulateClick
//
//  Created by mahabali on 01/03/23.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: {
            let clicker = MouseClicker()
            clicker.start()
            //RunLoop.main.run()
        })
       
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

