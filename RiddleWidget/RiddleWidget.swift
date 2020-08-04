//
//  RiddleWidget.swift
//  RiddleWidget
//
//  Created by Roger Tan on 03/08/2020.
//

import WidgetKit
import SwiftUI
import CommonLibrary

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), riddle: Riddle.random())
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let riddles = Riddle.shuffleList()
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, riddle: riddles[hourOffset])
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let riddle: Riddle
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct RiddleWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack {
            Color(.primaryBackground)
            HStack {
                Text("🤔")
                    .unredacted()
                    .font(.system(size: 50))
                Text(entry.riddle.text)
                    .foregroundColor(Color(.primaryColor))
            }.padding()
        }
        .widgetURL(URL(string: "riddle://\(entry.riddle.id)"))
    }
}

@main
struct RiddleWidget: Widget {
    private let kind: String = "RiddleWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            RiddleWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium])
        .configurationDisplayName("Riddle of the moment")
        .description("Display a random riddle each hour.")
    }
}

struct RiddleWidget_Previews: PreviewProvider {
    static var riddle = Riddle.random()
    
    static var previews: some View {
        Group {
            RiddleWidgetEntryView(entry: SimpleEntry(date: Date(), riddle: riddle))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            
            RiddleWidgetEntryView(entry: SimpleEntry(date: Date(), riddle: riddle))
                .redacted(reason: .placeholder)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
