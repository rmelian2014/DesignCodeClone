//
//  UpdateList.swift
//  DesignCodeClone
//
//  Created by mohammad yasir on 14/11/20.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(text: "Text", title: "title", image: "Card1", date: "Jan 1"))
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update : update)){
                        HStack{
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing , 4)
                            
                            VStack(alignment : .leading , spacing : 8.0){
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        .padding(.vertical , 8)
                    }
                }
                
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                
                .onMove { (source : IndexSet , destination : Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            
            .navigationTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action : addUpdate){
                Text("Add Update")
            }, trailing : EditButton())
            
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update : Identifiable {
    var id = UUID()
    var text : String
    var title : String
    var image : String
    var date : String
}

let updateData = [
    
    Update(text: "Take your app to appstore with advace technologies and best experiance", title: "SwiftUI Advanced", image: "Card1", date: "Jan 1"),
    Update(text: "Design and generate high quality aimations of landing and transformation with 3d animation", title: "Webflow", image: "Card2", date: "OCT 17"),
    Update(text: "Quick prototype with advance and hight quality animation sets of 3d effecrs and many more", title: "Protopie", image: "Card3", date: "MAR 4"),
    Update(text: "Learn how to code custom animations and gestrure on action with all effects over swiftUI", title: "SwiftUI", image: "Card4", date: "NOV 11"),
    Update(text: "Create a powerfull interation with farmer plagrdound in swiftUI and enojoy", title: "Farmer Playground", image: "Card5", date: "SEP 1")
    
]

