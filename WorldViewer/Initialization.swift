//
//  Initialization.swift
//  Initialization
//
//  Created by Stuart Rankin on 7/21/21.
//

import Foundation
import UIKit

extension WorldViewController
{
    func MainInitialization()
    {
        WorldViewController.StartTime = CACurrentMediaTime()
        UptimeStart = CACurrentMediaTime()
        FileIO.Initialize()
        #if DEBUG
        if let FoundCommands = FileIO.GetExCommands()
        {
            for XCmd in FoundCommands
            {
                Debug.Print("Found external command: \(XCmd.rawValue)")
            }
        }
        else
        {
            Debug.Print("No external commands found.")
        }
        #endif
        Settings.Initialize()
        Settings.UpdateForFeatureLevel()
        Settings.AddSubscriber(self)
        
        //Check the previous version - if it is different, reset the instantiation count.
        let IVersion = Versioning.VerySimpleVersionString()
        let PVersion = Settings.GetString(.InstantiationVersion)
        if PVersion != IVersion
        {
            Settings.SetString(.InstantiationVersion, IVersion)
            Settings.SetInt(.InstantiationCount, 0)
        }
        let InstantiationCount = Settings.IncrementInt(.InstantiationCount)
        //If the instantiation count is over a certain number, stop showing the initial version number.
        if InstantiationCount > 10
        {
            Settings.SetBool(.ShowInitialVersion, false)
        }
        
        SoundManager.Initialize()
        CityManager.Initialize()
    }
}
