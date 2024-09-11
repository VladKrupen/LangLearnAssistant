//
//  AddNewWordView.swift
//  LangLearnAssistant
//
//  Created by Vlad on 11.09.24.
//

import SwiftUI

struct AddNewWordView: View {
    
    @State var newWord = ""
    @State var wordTranslate = ""
    @State var wordDescription = ""
    @State var showAlert: Bool = false
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New word")
                    .font(.system(size: 20, weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    withAnimation {
                        listViewModel.isShowAddView.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.black)
                }
            }
            
            VStack(alignment: .leading) {
                Text("TR")
                    .font(.system(size: 12, weight: .black))
                
                HStack {
                    TextField("Word", text: $newWord)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack {
                    TextField("Translate", text: $wordTranslate)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Text("Description")
                    .font(.system(size: 14, weight: .black))
                    .padding(.top, 23)
                    .padding(.leading, 23)
                HStack {
                    TextEditor(text: $wordDescription)
                        .frame(height: 90)
                        .colorMultiply(Color(.systemGray6))
                        .autocorrectionDisabled()
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            }
            
            Spacer()
            Button {
               
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
    AddNewWordView()
}

