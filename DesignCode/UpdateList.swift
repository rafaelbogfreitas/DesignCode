//
//  UpdateList.swift
//  DesignCode
//
//  Created by Rafael Freitas on 02/01/21.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var updateStore = UpdateStore()
    
    func addUpdate() {
        updateStore.updates.append(
            Update(
                image: "",
                title: "",
                text: "",
                date: ""
            )
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(updateStore.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(
                                        .system(
                                            size: 20,
                                            weight: .bold
                                        )
                                )
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
                .onDelete { index in
                    if let index = index.first {
                        updateStore.updates.remove(at: index)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    updateStore.updates.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarTitle(Text("Updates"))
                .navigationBarItems(
                    leading:Button(action: addUpdate) { Text("Add update") },
                    trailing: EditButton()
                )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI Advanced", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "JAN 1"),
    Update(image: "Card2", title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17"),
    Update(image: "Card3", title: "ProtoPie", text: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27"),
    Update(image: "Card4", title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26"),
    Update(image: "Card5", title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11")
]
