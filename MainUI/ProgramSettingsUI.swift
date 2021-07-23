//
//  ProgramSettingsUI.swift
//  ProgramSettingsUI
//
//  Created by Stuart Rankin on 7/16/21.
//

import Foundation
import SwiftUI


struct ProgramSettingsUI: View
{
    @EnvironmentObject var Changed: ChangedSettings
    @Environment(\.presentationMode) var presentionMode: Binding<PresentationMode>
    @State var ShowAbout: Bool = false
    
    var body: some View
    {
        NavigationView
        {
            VStack(alignment: .leading)
            {
                VStack(alignment: .leading)
                {
                    Button(action:
                            {
                        ShowAbout.toggle()
                    })
                    {
                        Text("About Flatland")
                            .font(.headline)
                    }
                    Text("Show general information about Flatland.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Divider()
                    .background(Color.black)
            }
            .navigationBarTitle(Text("Flatland Settings"))
            .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button(action:
                            {
                        self.presentionMode.wrappedValue.dismiss()
                    }
                    )
                    {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
    }
}

struct ProgramSettingsUI_Previews: PreviewProvider
{
    static var previews: some View
    {
        ProgramSettingsUI()
            .environmentObject(ChangedSettings())
    }
}

