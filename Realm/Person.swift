//
//  Person.swift
//  Realm
//
//  Created by Bach Nghiem on 26/10/2023.
//

import Foundation
import RealmSwift

class Person: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var birthdate: String = ""
    convenience init(name: String, birthdate: String) {
        self.init()
        self.name = name
        self.birthdate = birthdate
    }
}

