import SwiftUI
import ImageIO
struct MapView: View {
    @State private var pinimage : Image = Image("Pin")
    @State private var mapimage: Image = Image("Map")
    //declares image variable names that are located in the assets
    
    private let pinSize: CGFloat = 100
    /*#-code-walkthrough(3.offset)*/
    @State private var offset = CGSize.zero
    /*#-code-walkthrough(3.offset)*/
    //#-learning-code-snippet(addScale)
    /*#-code-walkthrough(3.dragGestureVariable)*/
    var dragGesture: some Gesture {
        DragGesture()
        /*#-code-walkthrough(3.onChanged)*/
            .onChanged { value in
                offset = CGSize(width: value.startLocation.x + value.translation.width - pinSize/2,
                                height: value.startLocation.y + value.translation.height - pinSize/2)
                //allows user to drag pin using the touchpad
                //#-learning-code-snippet(setTheScale)
            }
        /*#-code-walkthrough(3.onChanged)*/
        //#-learning-code-snippet(animateToPlace)
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
                    /*#-code-walkthrough(3.offsetModifier)*/
                        .offset(offset)
                    /*#-code-walkthrough(3.offsetModifier)*/
                    /*#-code-walkthrough(3.applyDragToCircle)*/
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
