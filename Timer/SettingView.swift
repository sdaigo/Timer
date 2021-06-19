//
//  SettingView.swift
//  Timer
//
//  Created by shitara on 2021/06/19.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("\(timerValue)")
                    .font(.largeTitle)
                Spacer()
                Picker(selection: $timerValue, label: Text("Select"), content: {
                        Text("10").tag(10)
                        Text("20").tag(20)
                        Text("30").tag(30)
                        Text("40").tag(40)
                        Text("50").tag(50)
                        Text("60").tag(60)
                    }
                )
                Spacer()
            } // VStack
        } // ZStack
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(timerValue: 10)
    }
}
