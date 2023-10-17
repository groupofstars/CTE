//
//  DropDown.swift
//  CTE
//
//  Created by Leo Taylor on 8/1/23.
//

import SwiftUI
struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}
struct DropDown: View {
    @Binding var textppp: String
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45

    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                TextField(selectedOption == nil ? placeholder : selectedOption!.value, text:$textppp)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)

                Spacer()

                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                        textppp=option.value
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}
//struct DropDown_Previews: PreviewProvider {
//    static var uniqueKey: String {
//        UUID().uuidString
//    }
//
//    static let options: [DropdownOption] = [
//        DropdownOption(key: uniqueKey, value: "Sunday"),
//        DropdownOption(key: uniqueKey, value: "Monday"),
//        DropdownOption(key: uniqueKey, value: "Tuesday"),
//        DropdownOption(key: uniqueKey, value: "Wednesday"),
//        DropdownOption(key: uniqueKey, value: "Thursday"),
//        DropdownOption(key: uniqueKey, value: "Friday"),
//        DropdownOption(key: uniqueKey, value: "Saturday")
//    ]
//
//    @State private var text11: String = ""
//    @State private var selectedOption: String = ""
//    static var previews: some View {
//        Group {
//            DropDown(
//                textppp: $text11,
//                placeholder: "Day of the week",
//                options: options,
//                onOptionSelected: { option in
//                    print(option)
//            })
//            .padding(.horizontal)
//        }
//    }
//}
struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}
