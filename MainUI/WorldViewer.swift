//
//  WorldViewer.swift
//  Flatland Universal
//
//  Created by Stuart Rankin on 7/14/21.
//

import Foundation
import UIKit
import SwiftUI

struct WorldViewer: UIViewControllerRepresentable
{
    @Binding var DisplayTime: String
    
    func makeUIViewController(context: Context) -> WorldViewController
    {
        let ActualController = WorldViewController()
        ActualController.UIDelegate = context.coordinator
        return ActualController
    }
    
    func updateUIViewController(_ uiViewController: WorldViewController,
                                context: Context)
    {
    }
    
    /// Create a coordinator for the class to talk with the main live view.
    func makeCoordinator() -> Coordinator
    {
        Coordinator(self)
    }
    
    /// Coordinator class to talk with the live view UIViewController.
    class Coordinator: NSObject, WorldViewControllerDelegate
    {
        /// Parent content view.
        var Parent: WorldViewer
        
        /// Initializer.
        /// - Parameter Parent: Parent of the coordinator.
        init(_ Parent: WorldViewer)
        {
            self.Parent = Parent
        }
        
        func UpdateClock(NewTime: String)
        {
            DispatchQueue.main.async
            {
                self.Parent.DisplayTime = NewTime
            }
        }
    }
}

protocol WorldViewControllerDelegate: AnyObject
{
    func UpdateClock(NewTime: String)
}
