import SwiftUI

struct PhotoView: View {
    @StateObject var dataModel = DataModel()
    
    
    var body: some View {
            /*#-code-walkthrough(1.environmentObject)*/
        NavigationStack {
                GridView()
            
            }
            .environmentObject(dataModel)
            /*#-code-walkthrough(1.environmentObject)*/
            .navigationViewStyle(.stack)
        }
        
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

//There are several classes within the Image Gallery App that make the PhotoView operate. This class calls GridView(), where the photos are displayed on, and allows it to function
