//
//  WidgetView.swift
//  WidgetsApp
//
//  Created by Ragul Lakshmanan on 12/07/23.
//

import SwiftUI

struct WidgetView: View {
    var body: some View {
        VStack {
            Text("ML TEST")
            Button("Start Live Activity") {
                do {
                    try LiveActivityManager.startActivity(value: "ML 1")
                } catch {
                    print(error.localizedDescription)
                }
            }
            .foregroundColor(.black)
            Button("End Live Activity") {
                Task {
                    await LiveActivityManager.endAllActivities()
                }
            }
            .foregroundColor(.black)
        }
        .padding()
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
    }
}
