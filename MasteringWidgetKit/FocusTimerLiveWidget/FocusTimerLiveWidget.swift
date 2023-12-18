//
//  FocusTimerLiveWidget.swift
//  WidgetKitExtensionExtension
//
//  Created by koala panda on 2023/10/03.
//

import WidgetKit
import SwiftUI


// フォーカスタイマーのライブウィジェットを定義
struct FocusTimerLiveWidget: Widget{
    var body: some WidgetConfiguration{
        // ビューの設定
        // ActivityConfigurationを使用すると、ロック画面にも表示されるようになる
        ActivityConfiguration(for: FocusTimerAttributes.self) { context in
            FocusTimerEntryView(context: context)
        } dynamicIsland: { context in
            // ダイナミックアイランドの設定
            DynamicIsland{
                DynamicIslandExpandedRegion(.center) {
                    HStack{
                        // 残り時間をタイマーで表示
                        Text(context.state.endTime, style: .timer)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        // アプリの名前を表示
                        Text(context.attributes.timerName)
                            .font(.body)
                    }
                }
            } compactLeading: {
                // 最小化されたダイナミックアイランドの左側領域
                // 残り時間をタイマースタイルで表示
                Text(context.state.endTime, style: .timer)
                    .foregroundColor(.white)
            } compactTrailing: {
                // 最小化されたダイナミックアイランドの右側アラームのアイコンを表示
                Image(systemName: "alarm")
            } minimal: {
                // 2つのウィジェットを同時に表示された場合の一番小さなアイコン
                // 今回は設定しない
                EmptyView()
            }
        }
    }
}
