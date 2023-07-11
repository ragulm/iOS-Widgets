//
//  MLWidgetBundle.swift
//  MLWidget
//
//  Created by Ragul Lakshmanan on 11/07/23.
//

import WidgetKit
import SwiftUI

@main
struct MLWidgetBundle: WidgetBundle {
    var body: some Widget {
        //UNCOMMENT TO CHECK STATIC WIDGET
        MLWidget()
        
        //UNCOMMENT TO CHECK LIVE ACTIVITY
//        MLWidgetLiveActivity()
    }
}
