//
//  WidgetManager.swift
//  WidgetsApp
//
//  Created by Ragul Lakshmanan on 12/07/23.
//

import Foundation
import ActivityKit

enum LiveActivityManagerError: Error {
    case failed
}

struct MLWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var value: String
    }
}

@available(iOS 16.2, *)
class LiveActivityManager {

    @discardableResult
    static func startActivity(value: String) throws -> String {
        var activity: Activity<MLWidgetAttributes>?
        let initialState = MLWidgetAttributes.ContentState(value: value)
        do {
            activity = try Activity.request(attributes: MLWidgetAttributes(),
                                            contentState: initialState,
                                            pushType: nil)
            guard let id = activity?.id else { throw LiveActivityManagerError.failed }
            return id
        } catch {
            throw error
        }
    }

    static func endAllActivities() async {
        for activity in Activity<MLWidgetAttributes>.activities {
            await activity.end(dismissalPolicy: .immediate)
        }
    }

    static func endActivity(_ id: String) async {
        await Activity<MLWidgetAttributes>.activities.first(where: { $0.id == id })?.end(dismissalPolicy: .immediate)
    }

    static func updateActivity(id: String, value: String) async {
        let updatedContentState = MLWidgetAttributes.ContentState(value: value)
        let activity = Activity<MLWidgetAttributes>.activities.first(where: { $0.id == id })
        await activity?.update(using: updatedContentState)
    }
}
