import SwiftUI
import PhotosUI
//#-learning-task(gridView)
//#-learning-task(addAnImage)

/*#-code-walkthrough(5.gridView)*/
struct GridView: View {
    /*#-code-walkthrough(5.gridView)*/
    /*#-code-walkthrough(5.dataModel)*/
    @EnvironmentObject var dataModel: DataModel
    /*#-code-walkthrough(5.dataModel)*/

    private static let initialColumns = 3
    /*#-code-walkthrough(6.isEditingPhotos)*/
    @State private var isEditing = false
    /*#-code-walkthrough(6.isEditingPhotos)*/

    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var numColumns = initialColumns
    
    /*#-code-walkthrough(6.photoSelection)*/
    @State private var selectedPhoto: PhotosPickerItem?
    /*#-code-walkthrough(6.photoSelection)*/
    
    private var columnsTitle: String {
        gridColumns.count > 1 ? "\(gridColumns.count) Columns" : "1 Column"
    }
    
    var body: some View {
        VStack {
            if isEditing {
                ColumnStepper(title: columnsTitle, range: 1...8, columns: $gridColumns)
                .padding()
            }
            /*#-code-walkthrough(5.gridImplementation)*/
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    /*#-code-walkthrough(5.gridImplementation)*/
                    /*#-code-walkthrough(5.forEach)*/
                    ForEach($dataModel.items) { $item in
                        /*#-code-walkthrough(5.forEach)*/
                    
                        NavigationLink(destination: DetailView(item: $item)) {
                            /*#-code-walkthrough(5.gridItemView)*/
                            /*#-code-walkthrough(5.geometryReader)*/
                            Rectangle()
                                .overlay {
                                    /*#-code-walkthrough(5.geometryReader)*/
                                    /*#-code-walkthrough(5.gridParameters)*/
                                    GridItemView(item: item)
                                    /*#-code-walkthrough(5.gridParameters)*/
                                }
                            //#-learning-code-snippet(gridView)
                            /*#-code-walkthrough(5.gridItemView)*/
                        }
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                        .overlay(alignment: .topTrailing) {
                            /*#-code-walkthrough(6.editUI)*/
                            if isEditing {
                                Button {
                                    /*#-code-walkthrough(6.removeAction)*/
                                    withAnimation {
                                        dataModel.removeItem(item)
                                    }
                                    /*#-code-walkthrough(6.removeAction)*/
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                                .font(Font.title)
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(.white, .red)
                                }
                                .offset(x: 7, y: -7)
                            }
                            /*#-code-walkthrough(6.editUI)*/
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Image Gallery")
        .navigationBarTitleDisplayMode(.inline)
        /*#-code-walkthrough(6.toolbar)*/
        .toolbar {
            /*#-code-walkthrough(6.toolbar)*/
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()) {
                    Image(systemName: "plus")
                        .disabled(isEditing)
                }
            }
        }
        .onChange(of: selectedPhoto){ newSelectedPhoto in
            guard let newSelectedPhoto else { 
                return
                
            }
            
            Task {
                if let newItem = await dataModel.newItemFromPickerItem(newSelectedPhoto) {
                    withAnimation {
                        dataModel.addItem(newItem)
                    }
                }
            }
        }
    }
}
 
