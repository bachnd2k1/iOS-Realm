//
//  RealmRepository.swift
//  Realm
//
//  Created by Bach Nghiem on 26/10/2023.
//

import Foundation
import RealmSwift

protocol RealmRepository {
    func saveData(name: String, birthdate: String)
    func deleteData(name: String, birthdate: String)
    func updateObject(currentName: String, currentBirthdate: String, newName: String, newBirthdate: String)
    func getAll()
}

class RealmRepositoryImpl: RealmRepository {
    func saveData(name: String, birthdate: String) {
        let data = Person()
        data.name = name
        data.birthdate = birthdate
        try! realm.write {
            realm.add(data)
        }
    }
    
    func deleteData(name: String, birthdate: String) {
        let dataFilters = realm.objects(PersonalInfo.self).filter("name = %@ AND birthdate = %@ ", name, birthdate)
        try! realm.write {
            realm.delete(dataFilters)
        }
    }
    
    func updateItem(currentName: String, currentBirthdate: String, newName: String, newBirthdate: String) {
        let dataFilters = realm.objects(Person.self).filter("name = %@ AND birthdate = %@ ", name, birthdate)
        try! realm.write {
            realm.delete(dataFilters)
        }
    }
    
    func getAll() -> [Person] {
        return realm.objects(Person.self).toArray(ofType: PersonalInfo.self)
    }
}
