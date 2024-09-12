//
//  AddNewLinkView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 12.09.24.
//

import SwiftUI
import RealmSwift

struct AddNewLinkView: View {
    
    @State var linkTitle: String = ""
    @State var link: String = ""
    @State var showAlert: Bool = false
    @EnvironmentObject var linkViewModel: LinkViewModel
    @ObservedResults(LinkItem.self) var linkItems
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    linkViewModel.isShowAddLink.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.black)
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    TextField("Title", text: $linkTitle)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack {
                    TextField("Link", text: $link)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))


            }
            
            Spacer()
            Button {
                if linkTitle.isEmpty, link.isEmpty {
                    showAlert.toggle()
                } else {
                    let newLink = LinkItem()
                    newLink.linkName = linkTitle
                    newLink.link = link
                    $linkItems.append(newLink)
                    withAnimation {
                        linkViewModel.isShowAddLink.toggle()
                    }
                }
            } label: {
                Text("Save")
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.314, green: 0.631, blue: 0.498))
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
            }
            .alert(Text("Empty fields"), isPresented: $showAlert) {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(16)
        .background(.white)
    }
}

#Preview {
    AddNewLinkView()
}
