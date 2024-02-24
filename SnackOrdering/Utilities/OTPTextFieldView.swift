//
//  OTPTextFieldView.swift
//  SnackOrdering
//
//  Created by Sardorbek Saydamatov on 07/02/24.
//
import SwiftUI

struct OTPTextFieldView: View {
    @State var numberFields: Int = 6
    @State var enterValue: [String]
    @FocusState var focusField: Int?
    @State var oldValue = ""
    
    init(numberFields: Int) {
        self._numberFields = State(initialValue: numberFields)
        self._enterValue = State(initialValue: Array(repeating: "", count: numberFields))
    }
    var body: some View {
        HStack {
            ForEach(0..<numberFields, id: \.self) {index in
                VStack(spacing: 0) {
                    TextField("", text: $enterValue[index], onEditingChanged: { editing in
                        if editing {
                            oldValue = enterValue[index]
                        }
                    })
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .focused($focusField, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) { newValue in
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        
                        if !newValue.isEmpty {
                            if index == numberFields - 1 {
                                focusField = nil
                            } else {
                                focusField = (focusField ?? 0) + 1
                            }
                        } else {
                            focusField = (focusField ?? 0) - 1
                        }
                    }

                    Rectangle()
                        .frame(width: 10, height: 2)
                        .foregroundStyle(Color.gray.opacity(0.5))
                }
                .frame(height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1).foregroundStyle(Color.red))
            }
        }
    }
}

#Preview {
    OTPTextFieldView(numberFields: 6)
}
