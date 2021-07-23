//
//  MainTimer.swift
//  MainTimer
//
//  Created by Stuart Rankin on 7/18/21.
//

import Foundation
import UIKit

class MainTimer
{
    init()
    {
    }
    

    
    func Start(Block: @escaping ((Date) -> Void))
    {
        PrimaryTimer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                            repeats: true, block:
                                                {
            [weak self] _ in
            Block(Date())
        })
    }
    
    var PrimaryTimer: Timer? = nil
}
