import SwiftUI


struct StatusView: View {
    @State var yourName: String = ""
    @State var string2: String = ""
    // Variables that are used to store the text types in the "Subject:" and "Text:" boxes
    @State var numberName: Int = 0
    @State var numberString: Int = 0
    @State var numberButton: Int = 0

    // Variables that are used in the if/else statements in order to run the "Update" and "Refresh" buttons
    
    let backgroundGradient = LinearGradient(
        colors: [Color.white, Color.teal, Color.white],
        startPoint: .top, endPoint: .bottom)
    // Used to create the white/teal/white gradient in the background of the screen
    
    var body: some View {
        ZStack{
            backgroundGradient
            VStack {
                
                Text("Current Status")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 48)
                
                if (numberName == 0){
                    TextField("Your name: ", text: $yourName, prompt: Text("Subject: ").foregroundColor(.gray)).padding(10).padding(.horizontal).overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 2).padding(.horizontal)
                    }
                    // The if statement is used by the "Update" buttons if/else. If the update button is clicked, then the textfield collecting the text will be changed to text printed on the pase. If "Refresh" is clicked, the printed text will be replaced by an empty editable textfield. This is the subject line, so the printed text will print bolded.
                } else if (numberName == 1){
                    Text(yourName)
                        .fontWeight(.bold)
                        .padding(.top)
                }
                // Same reason as previous if statement. This is the text line, so printed text will be printed normally. The inserted text will be inserted in a scrolling horizontal line, as that is how textfields work. However once printed, the text will be printed in a paragraph format. 
                
                if (numberString == 0){
                    TextField("", text: $string2, prompt: Text("Text: ").foregroundColor(.gray)).padding(10).padding(.horizontal).overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 2).padding(.horizontal)
                        
                    }
                // This if statement is used to identify if there is text or not in the "Subject:" and "Text:" boxes. If there isn't text, the update button will not trigger any actions to occur. 
                    
                } else if (numberString == 1){
                    Text(string2)
                        .padding(.bottom)
                }
                HStack{
                    if (numberButton == 0){
                        Button("Update"){
                            if (yourName != "" && string2 != ""){
                                numberName = 1
                                numberString = 1
                                numberButton = 1
                            }
                    // This button is used to refresh and reset the text to empty by setting the strings to ""
                    
                        }.padding(.all, 8.0).overlay(RoundedRectangle(cornerRadius: 18).stroke(.black,lineWidth: 3)).bold().foregroundColor(.black)
                    } else if (numberButton == 1){
                        Button("Refresh"){
                            numberName = 0
                            numberString = 0
                            numberButton = 0
                            yourName = ""
                            string2 = ""
                        }.padding(.all, 8.0).overlay(RoundedRectangle(cornerRadius: 18).stroke(.black,lineWidth: 3)).bold().foregroundColor(.black)
                    }
                }
                
               
                HStack {
                    Text("")
                  
                    Spacer()
                   
                }.padding()
            
                Divider()                
                    .padding([.top, .leading])

                    
                    HStack(spacing: 42) {
                       
                        Text("✈️")
                            .font(.system(size: 48))
                        Text("🚘")
                            .font(.system(size: 52))
                        Text("🧳")
                            .font(.system(size: 54))
                        Text("🚦")
                            .font(.system(size: 56))
                        
                        
                    }
                // A horizontal stack of chosen emojis. Are centered within the screen 
                .padding()
                
                Divider()
                
                
                
            }
        }
    }
    
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}















