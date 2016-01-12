//
//  MSClientSetup.swift
//  wiggler
//
//  Created by Luis Carlos Rosa on 12/01/16.
//  Copyright © 2016 Wiggler. All rights reserved.
//

import Foundation

class MSClientSetup {
    var client = MSClient()
    static let sharedInstance = MSClientSetup()
    init() {
        setupClient()
    }
    
    func setupClient() {
        self.client = MSClient(applicationURLString:"https://wigglerjs.azure-mobile.net/", applicationKey:"GELRJLGBNIQotMfbgimdOwYqEKJGlM75")
    }
}