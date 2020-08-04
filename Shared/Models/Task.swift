//
//  Task.swift
//  Shared
//
//  Created by Omar on 31/07/20.
//

import Foundation

struct Task : Identifiable {
    let id = UUID()
    var name: String
    var completed = false
}
