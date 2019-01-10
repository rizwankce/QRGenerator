//
//  ViewController.swift
//  QRGenerator
//
//  Created by Rizwan on 14/08/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textfield: NSTextField!
    @IBOutlet weak var imageView: NSImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    @IBAction func onTapCreateQRCode(_ sender: Any) {
        var qrCode = QRCode(textfield.stringValue)
        qrCode.size = imageView.bounds.size
        imageView.image = qrCode.image
    }


}

