//
//  Settings.swift
//  KVODemo
//
//  Created by Howard Chang on 4/7/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

@objc class Settings: NSObject {
    static var shared = Settings()
    @objc dynamic var fontSize: Int
    @objc dynamic var iconName: String
    override private init() {
        fontSize = 17
        iconName = "sun.haze.fill"
    }
}
