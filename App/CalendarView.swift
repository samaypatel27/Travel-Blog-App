import SwiftUI


struct CalendarView: View {
    
    @State var selectedDate: Date = Date()
    var body: some View {
        VStack() {
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                .font(.system(size: 28))
                .bold()
                .foregroundColor(Color.accentColor)
                .padding()
                .animation(.spring(), value: selectedDate)
                .frame(width: 500)
            Divider().frame(height: 1)
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
            Divider()
        }
        .padding(.vertical, 100)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
