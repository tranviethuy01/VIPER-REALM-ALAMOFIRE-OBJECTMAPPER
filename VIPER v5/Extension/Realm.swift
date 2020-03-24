//
//  Realm.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/21/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

import RealmSwift
extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) {
        if isInWriteTransaction == true {
            try! block()
        } else {
            try! write(block)
        }
    }
}
