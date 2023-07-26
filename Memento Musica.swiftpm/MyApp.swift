import SwiftUI

@main
struct MyApp: App {
    
    // View def
    @State var isPresented = 0
    
    var body: some Scene {
        WindowGroup {
            switch (isPresented){
            case 1:
                SceneView(isPresented : $isPresented)
            case 2:
                GuitarView(isPresented : $isPresented)
            default:
                StartView(isPresented : $isPresented)
            }
        }
    }
}
