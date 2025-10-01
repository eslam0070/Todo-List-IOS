//
//  ToDoItem.swift
//  Todo-List
//
//  Created by Eslam Gamal on 30/09/2025.
//

import Foundation
import SwiftData
@Model
final class ToDoItem{
    var title:String
    var timestamp:Date
    var isCritical:Bool
    var isComplete:Bool
    init(
        title: String = "",
        timestamp: Date = .now,
        isCritical: Bool = false,
        isComplete: Bool = false
    ) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isComplete = isComplete
    }
}
