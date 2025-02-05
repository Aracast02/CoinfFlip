import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
                MainMenuView()
                .background(Image("background").resizable().scaledToFill())
        }
    }
}
