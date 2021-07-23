//
//  FlatlandMobileApp.swift
//  FlatlandMobile
//
//  Created by Stuart Rankin on 7/22/21.
//

import SwiftUI

@main struct Flatland_UniversalApp: App
{
    var body: some Scene
    {
        WindowGroup
        {
            ContentView().environmentObject(ChangedSettings())
        }
    }
}
