//
//  LinkItem.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI
import RealmSwift

final class LinkItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var linkName: String = ""
    @Persisted var link: String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}
