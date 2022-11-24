//
//  unix_translatorApp.swift
//  unix_translator
//
//  Created by Pedro Almeida on 22/11/22.
//

import SwiftUI

@main
struct unix_translatorApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusBarItem: NSStatusItem?
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let menuView = MenuView(unixTime: "", formattedTime: "")
        
        //efects for the popover
        popOver.behavior = .transient
        popOver.animates = true
        
        //set empty view
        popOver.contentViewController = NSViewController()
        //add setting view as SwiftUI view
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        //our menu bar is the only view
        popOver.contentViewController?.view.window?.makeKey()
        
        //create status bar btn. good pratice to do a safe check
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let MenuButton = statusBarItem?.button {
            MenuButton.image = NSImage(systemSymbolName: "icloud.and.arrow.up.fill", accessibilityDescription: nil)
            MenuButton.action = #selector(MenuButtonToogle)
        }
    }
    
    
    //action to perform when status bar item is pressed
    //need to comply with objective-c code so we use '@objc'.
    @objc func MenuButtonToogle(sender: AnyObject){
        if popOver.isShown{
            popOver.performClose(sender)
        } else {
            if let menuButton = statusBarItem?.button {
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: .minY)
            }
        }
    }
}
