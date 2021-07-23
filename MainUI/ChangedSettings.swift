//
//  ChangedSettings.swift
//  ChangedSettings
//
//  Created by Stuart Rankin on 7/16/21.
//

import Foundation
import SwiftUI

class ChangedSettings: ObservableObject
{
    @Published var ChangedFilter: String = ""
    {
        didSet
        {
            print("ChangedFilter=\(ChangedFilter)")
        }
    }
}
