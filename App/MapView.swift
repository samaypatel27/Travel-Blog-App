import SwiftUI
import ImageIO
struct MapView: View {
    @State private var pinimage : Image = Image("Pin")
    @State private var mapimage: Image = Image("Map")
    //declares image variable names that are located in the assets
    
    private let pinSize: CGFloat = 100
    
    @State private var offset = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture()
        
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - pinSize/2,
                                height: value.startLocation.y + value.translation.height - pinSize/2)
                //allows user to drag pin using the touchpad
                
            }
        
    }
    
    var body: some View {
        ScrollView(
            [.vertical, .horizontal],
            showsIndicators: false
        //allows the user to drag across the map using their fingers
        ) {
            
            VStack {
                Image("Map")
                    .scaledToFit()
                HStack
                {
                    Text("Drag the pin with the touchpad, use two fingers to navigate the map using touchscreen")
                        .padding()
                    Image("Pin")
                        .resizable()
                        .frame(width: pinSize, height: pinSize)
                    
                        .offset(offset)
                    
                        .gesture(dragGesture)
                    //calls the dragGesture method to allow the pin to be dragged
                    
                }
                            
                
                
            }
            .frame(maxWidth: .infinity)
            
        }
    }
    
    
    
    struct MapView_Previews: PreviewProvider {
        static var previews: some View {
            MapView()
        }   
    }
}
