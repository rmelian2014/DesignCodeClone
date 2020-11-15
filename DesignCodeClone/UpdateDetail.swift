//
//  UpdateDetail.swift
//  DesignCodeClone
//
//  Created by mohammad yasir on 14/11/20.
//

import SwiftUI

struct UpdateDetail: View {
    
    var update : Update = updateData[0]
    
    var body: some View {
        List{
            VStack(spacing : 20){
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth : .infinity)
                Text(update.text)
                    .frame(maxWidth : .infinity, alignment: .leading)
            }
            .navigationTitle(update.title)
        }
        .listStyle(PlainListStyle())
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
