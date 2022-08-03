

import SwiftUI

struct ContentView: View {
    @State private var counter: Float = 0
    @State private var   isAlertPresented: Bool = false
         
    var body: some View {
        VStack {
         Text("Hello, world!")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.blue)
            .background(Color.green)
            //.padding()
            Button("Hello World", action: {})
            Circle().frame(width: 30, height: 30)
            HStack {
                Text("Hello, world!")
                   .font(.title)
                   .fontWeight(.bold)
                   .foregroundColor(Color.blue)
                   .background(Color.green)
                   //.padding()
                   Button("Hello World", action: {})
                   Circle().frame(width: 30, height: 30)
            }
            if #available(iOS 15.0, *) {
                VStack {
                    Text("\(counter)")
                    Slider(value: $counter, in: 0...10, onEditingChanged: {_ in})
                    Button("Tap on me") { isAlertPresented = true
                    }
                    Spacer()
                }
                .alert("Hello", isPresented: $isAlertPresented, actions: {})
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
