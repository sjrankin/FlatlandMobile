//
//  +SettingsHandling.swift
//  +SettingsHandling
//
//  Created by Stuart Rankin on 7/21/21.
//

import Foundation
import UIKit

extension WorldViewController: SettingChangedProtocol
{
    // MARK: - Setting changed handler
    
    func SubscriberID() -> UUID
    {
        return ClassID
    }
    
    /// Handle changes that affect Flatland overall or that need to take place at a main program level. Other
    /// changes may be handled lower in the code.
    /// - Parameter Setting: The setting that changed.
    /// - Parameter OldValue: The value of the setting before it was changed. May be nil.
    /// - Parameter NewValue: The new value of the setting. May be nil.
    func SettingChanged(Setting: SettingKeys, OldValue: Any?, NewValue: Any?)
    {
        
    }
}
