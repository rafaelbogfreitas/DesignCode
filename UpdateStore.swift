//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Rafael Freitas on 02/01/21.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
