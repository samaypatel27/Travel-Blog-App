import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            StatusView()
                .tabItem {
                    Label("Your Status", systemImage: "star")
                }
            PhotoView()
                .tabItem {
                    Label("Photo Gallery", systemImage: "camera")
                }
           
            MapView()
            
                .tabItem {
                    Label("Map", systemImage: "pin")
                }
            
            
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
