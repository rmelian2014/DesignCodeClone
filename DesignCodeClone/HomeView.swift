//
//  HomeView.swift
//  DesignCodeClone
//
//  Created by mohammad yasir on 09/11/20.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile : Bool
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                AvatarView(showProfile: $showProfile)
                
                Button(action: {self.showUpdate.toggle()}) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
                
            }
            .padding(.horizontal)
            .padding(.leading , 14)
            .padding(.top , 30)
            
            ScrollView (.horizontal , showsIndicators : false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees:
                                                            Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width : 275 , height : 275)
                    }
                }
                .padding(30)
                .padding(.bottom , 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section : Section
    
    var body: some View {
        VStack{
            HStack (alignment : .top){
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth : .infinity , alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top , 20)
        .padding(.horizontal , 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
// 5:15 14th 

struct Section : Identifiable {
    var id = UUID()
    var title : String
    var text : String
    var logo : String
    var image : Image
    var color : Color
}

let sectionData = [
    Section(title: "Prototype Design in Swift", text: "18 Sectionos", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))),
    Section(title: "Expertice in SwiftUI", text: "18 Sectionos", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card3")), color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))),
    Section(title: "Learn How to Swift", text: "18 Sectionos", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card6")), color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
    
]


