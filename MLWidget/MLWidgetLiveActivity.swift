//
//  MLWidgetLiveActivity.swift
//  MLWidget
//
//  Created by Ragul Lakshmanan on 11/07/23.
//

import WidgetKit
import SwiftUI

struct MLWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MLWidgetAttributes.self) { context in
            VStack {
                Text("ML TEST")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                        .resizable()
                        .frame(width: 44.0, height: 44.0)
                        .foregroundColor(.green)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    VStack {
                        Text("by ML")
                    }
                    .padding(.top, 16.0)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text("Order will be delivered soon")
                }
            } compactLeading: {
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .foregroundColor(.green)
            } compactTrailing: {
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .foregroundColor(.green)
            } minimal: {
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .foregroundColor(.green)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct MLWidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = MLWidgetAttributes()
    static let contentState = MLWidgetAttributes.ContentState(value: "TEST")

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
