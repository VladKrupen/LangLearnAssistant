//
//  LinkViewModel.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import Foundation

final class LinkViewModel: ObservableObject {
    @Published var isShowAddLink: Bool = false
    @Published var openUrl: String = ""
}
