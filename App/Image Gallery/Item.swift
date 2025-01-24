import SwiftUI
//#-learning-task(item)

/*#-code-walkthrough(2.itemModel)*/
struct Item: Identifiable {
    /*#-code-walkthrough(2.itemModel)*/

    /*#-code-walkthrough(2.id)*/
    let id = UUID()
    /*#-code-walkthrough(2.id)*/
    /*#-code-walkthrough(2.url)*/
    let url: URL
    /*#-code-walkthrough(2.url)*/
    //#-learning-code-snippet(addFavoriteProperty)
    
    //#-learning-code-snippet(mutatingFunc)
}

extension Item: Equatable {
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id && lhs.id == rhs.id
    }
}
