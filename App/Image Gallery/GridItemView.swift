import SwiftUI
//#-learning-task(gridItemView)

/*#-code-walkthrough(4.gridItemView)*/
struct GridItemView: View {
    /*#-code-walkthrough(4.gridItemView)*/
    /*#-code-walkthrough(4.properties)*/
    let item: Item
    /*#-code-walkthrough(4.properties)*/

    var body: some View {
        /*#-code-walkthrough(4.zStack)*/
        ZStack(alignment: .topTrailing) {
            /*#-code-walkthrough(4.zStack)*/
            /*#-code-walkthrough(4.asyncImage)*/
            AsyncImage(url: item.url) { image in
                /*#-code-walkthrough(4.asyncImage)*/
                /*#-code-walkthrough(4.imageView)*/
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                /*#-code-walkthrough(4.imageView)*/
            } placeholder: {
                /*#-code-walkthrough(4.progressView)*/
                ProgressView()
                /*#-code-walkthrough(4.progressView)*/
            }
        }
    }
}

struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        if let url = Bundle.main.url(forResource: "grizzly", withExtension: "jpg") {
            GridItemView(item: Item(url: url))
        }
    }
}
