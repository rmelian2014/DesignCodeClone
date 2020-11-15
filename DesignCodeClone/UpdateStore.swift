//
//  UpdateStore.swift
//  DesignCodeClone
//
//  Created by mohammad yasir on 14/11/20.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    @Published var updates : [Update] = updateData
}
