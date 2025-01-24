import SwiftUI

struct DetailView: View {
    @Binding var item: Item

    var body: some View {
        VStack(spacing: 60) {
            AsyncImage(url: item.url) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            //#-learning-code-snippet(addButton)
            //#-learning-code-snippet(addModifiers)
        }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "grizzly", withExtension: "jpg") {
            DetailView(item: .constant(Item(url: url)))
        }
    }
}
