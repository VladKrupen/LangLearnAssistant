//
//  LinkViewModel.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import Foundation

final class LinkViewModel: ObservableObject {
    @Published var isShowAddLink = false
    @Published var isShowLinkContent = false
    @Published var openUrl: String = ""
}
