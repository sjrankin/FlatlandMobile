//
//  ContentView.swift
//  Shared
//
//  Created by Stuart Rankin on 7/14/21.
//

import SwiftUI
import UIKit

struct ContentView: View
{
    @State var DisplayTime: String = "12:34:56 UTC"
    @State var ShowTop: Bool = true
    var IsOnTablet: Bool = UIDevice.current.userInterfaceIdiom == .pad
    var HeightMultiplier: Double = UIDevice.current.userInterfaceIdiom == .pad ? 1.0 : 1.35
    var TimeSize: Double = UIDevice.current.userInterfaceIdiom == .pad ? 50.0 : 40.0
    var TimeWeight: Font.Weight = UIDevice.current.userInterfaceIdiom == .pad ? .black : .bold
    @State var ShowSettings: Bool = false
    @EnvironmentObject var Changed: ChangedSettings
    
    var body: some View
    {
        ZStack
        {
            GeometryReader
            {
                Geometry in
                Color(UIColor(red: 0.05, green: 0.28, blue: 0.05, alpha: 1.0)).edgesIgnoringSafeArea(.bottom)
                Button(action:
                        {
                    ShowSettings.toggle()
                })
                {
                    GearIcon()
                }
                .position(x: 30,
                          y: 38)
                .padding(.trailing)
                .sheet(isPresented: $ShowSettings,
                       content:
                        {
                    ProgramSettingsUI()
                        .environmentObject(Changed)
                })
                
                Text($DisplayTime.wrappedValue)
                    .font(.system(size: TimeSize, design: .monospaced))
                    .fontWeight(TimeWeight)
                    .foregroundColor(ShowTop ? Color.white : Color.clear)
                    .multilineTextAlignment(.center)
                    .zIndex(100)
                    .frame(width: Geometry.size.width,
                           height: 40,
                           alignment: .center)
                    .position(x: Geometry.size.width / 2.0,
                              y: 100)
                
                Text($DisplayTime.wrappedValue)
                    .font(.system(size: TimeSize, design: .monospaced))
                    .fontWeight(TimeWeight)
                    .foregroundColor(ShowTop ? Color.clear : Color.white)
                    .zIndex(100)
                    .frame(width: Geometry.size.width,
                           height: 40,
                           alignment: .center)
                    .position(x: Geometry.size.width / 2.0,
                              y: Geometry.size.height - 30)
                
                WorldViewer(DisplayTime: $DisplayTime)
                    .frame(width: Geometry.size.width,
                           height: Geometry.size.height - 50)
                    .position(x: Geometry.size.width / 2.0,
                              y: (Geometry.size.height / 2.0) + 50)
            }.preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}


struct GearIcon: View
{
    var body: some View
    {
        Image(systemName: "gearshape")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 32, height: 32, alignment: .center)
            .foregroundColor(.yellow)
    }
}
