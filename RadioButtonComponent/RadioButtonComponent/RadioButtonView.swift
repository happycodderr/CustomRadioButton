
import SwiftUI

struct RadioButtonView: View {
    let currentRadioValue: String
    let prevSelectedValue: String
    let onSelection: (String) -> ()
    
    init(
        _ id: String,
        selectedId: String,
        onSelection: @escaping (String) -> Void
    ) {
        self.currentRadioValue = id
        self.prevSelectedValue = selectedId
        self.onSelection = onSelection
    }
    var body: some View {
        Button {
            if self.prevSelectedValue == self.currentRadioValue {
                self.onSelection("")
            } else {
                self.onSelection(self.currentRadioValue)
            }
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.prevSelectedValue == self.currentRadioValue ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .frame(width: 18, height: 18)
                Text(currentRadioValue)
                Spacer()
            }
        }

    }
}

struct RadioButtons: View {
    let items: [String]
    @State var selectedId: String = ""
    let callBackSelected: (String) -> ()
    
    var body: some View {
        List {
            ForEach(0..<items.count, id: \.self) { index in
                RadioButtonView(self.items[index],
                                selectedId: self.selectedId,
                                onSelection: self.radioCallBack)
            }
        } .listStyle(PlainListStyle())
    }
    
    func radioCallBack(id: String) {
        selectedId = id
        callBackSelected(id)
    }
}

struct ContentView: View {
    @State var objArr = ["Lucy", "Charlie", "Anita", "Grace"]
    @State var selectedRadioButton = "Lucy"
    var body: some View {
        VStack {
            Text("Select the name")
            RadioButtons(items: objArr,
                         selectedId: selectedRadioButton) { selectedVal in
                print("Selected name is --- \(selectedVal)")
                selectedRadioButton = selectedVal
            }
            Text("Selected ---: \(selectedRadioButton)")
            Spacer()
        }
    }
}

//#Preview {
//    RadioButtonView()
//}
