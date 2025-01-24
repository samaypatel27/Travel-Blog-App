import SwiftUI

struct ContentView: View {
    var body: some View {
        /*#-code-walkthrough(ContentView.tabView)*/
        TabView {
            StatusView()
                .tabItem {
                    Label("Your Status", systemImage: "star")
                }
            PhotoView()
                .tabItem {
                    Label("Photo Gallery", systemImage: "camera")
                }
            /*#-code-walkthrough(ContentView.tabView)*/
            /*#-code-walkthrough(ContentView.homeTab)*/
            MapView()
            /*#-code-walkthrough(ContentView.homeTab)*/
            /*#-code-walkthrough(ContentView.tabItem)*/
                .tabItem {
                    Label("Map", systemImage: "pin")
                }
            /*#-code-walkthrough(ContentView.tabItem)*/
            
            CalendarView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
            
            
            /*#-code-walkthrough(ContentView.addATab)*/
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
