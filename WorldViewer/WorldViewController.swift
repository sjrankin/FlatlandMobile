//
//  WorldViewController.swift
//  Flatland Universal
//
//  Created by Stuart Rankin on 7/14/21.
//

import Foundation
import UIKit

class WorldViewController: UIViewController
{
    weak var UIDelegate: WorldViewControllerDelegate? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.layer.backgroundColor = UIColor.black.cgColor
        MainClock = MainTimer()
        MainClock?.Start(Block: NewTime)
        
        MainInitialization()
    }
    
    var MainClock: MainTimer? = nil
    
    func NewTime(ClockTime: Date)
    {
        let Now = GetUTC()
        let Formatter = DateFormatter()
        Formatter.dateFormat = "HH:mm:ss"
        var TimeZoneAbbreviation = ""
        TimeZoneAbbreviation = "UTC"
        let TZ = TimeZone(abbreviation: TimeZoneAbbreviation)
        Formatter.timeZone = TZ
        var Final = Formatter.string(from: Now)
        let Parts = Final.split(separator: ":")
        let FinalText = Final + " " + TimeZoneAbbreviation
        UIDelegate?.UpdateClock(NewTime: FinalText)
    }
    
    /// Returns the date in UTC time zone. (Given the documentation, returning a new instance of `Date`
    /// is sufficient.)
    func GetUTC() -> Date
    {
        return Date()
    }
    
    func PlanetaryUpdate()
    {
        
    }
    
    public static var StartTime: Double = 0.0
    /// Start time (in seconds) of the current instance.
    var UptimeStart: Double = 0.0
    var PreviousHourValue: String = ""
    /// ID used for settings subscriptions.
    var ClassID = UUID()
}
