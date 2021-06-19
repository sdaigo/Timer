//
//  ContentView.swift
//  Timer
//
//  Created by shitara on 2021/06/19.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count = 0
    @State var showAlert = false

    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Spacer()
                    Text("残り \(timerValue - count)")
                        .font(.largeTitle)
                    Spacer()
                    HStack {
                        Button(action: {
                            startTimer()
                        }) {
                            Text("Start")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 120, height: 120)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        
                        Button(action: {
                            if let unwrappedTimerHandler = timerHandler {
                                if unwrappedTimerHandler.isValid == true {
                                    unwrappedTimerHandler.invalidate()
                                }
                            }
                        }) {
                            Text("Stop")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 120, height: 120)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            
            .onAppear {
                count = 0
            }
            
            .alert(isPresented: $showAlert) {
                Alert(title: Text("終了"), message: Text("終了です"),
                      dismissButton: .default(Text("OK"))
                )
            }
        
        
            .navigationBarItems(trailing:
                NavigationLink(
                    destination: SettingView()
                ) {
                    Text("秒数設定")
                }
            )
        }
    }
    
    func startTimer() {
        if let unwrappedTimerHandler = timerHandler {
            if unwrappedTimerHandler.isValid == true {
                return
            }
        }
        
        if timerValue - count <= 0 {
            count = 0
        }
        
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            coundDown()
        }
    }
    
    func coundDown() {
        count += 1
        
        if timerValue - count == 0 {
            timerHandler?.invalidate()
            showAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
