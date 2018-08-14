//
//  QRCode.swift
//  QRGenerator
//
//  Created by Rizwan on 14/08/18.
//  Copyright © 2018 Rizwan. All rights reserved.
//

import Foundation
import AppKit

struct QRCode {

    let data: Data?
    var size: CGSize = CGSize(width: 100, height: 100)

    init(_ string: String) {
        data = string.data(using: .isoLatin1)
    }

    var image: NSImage? {
        guard var ciImage = ciImage else {
            return nil
        }

        let ciImageSize = ciImage.extent.size
        let widthRatio = size.width / ciImageSize.width
        let heightRatio = size.height / ciImageSize.height
        let transform = CGAffineTransform.init(scaleX:widthRatio, y: heightRatio)

        ciImage = ciImage.transformed(by: transform)

        let imageRep: NSCIImageRep = NSCIImageRep(ciImage: ciImage)
        let nsImage: NSImage = NSImage(size: imageRep.size)
        nsImage.addRepresentation(imageRep)

        return nsImage
    }

    var ciImage: CIImage? {
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil

        }

        qrFilter.setDefaults()
        qrFilter.setValue(data, forKey: "inputMessage")
        return qrFilter.outputImage
    }
}
