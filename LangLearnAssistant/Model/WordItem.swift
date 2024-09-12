//
//  WordItem.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI
import RealmSwift

final class WordItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var location: String = "EN"
    @Persisted var mainWord: String = ""
    @Persisted var wordTranslate: String = ""
    @Persisted var wordDescription: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
