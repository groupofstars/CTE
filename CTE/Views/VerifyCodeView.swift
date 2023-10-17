import SwiftUI
import Combine
struct VerifyCodeView: View {
    @State private var digit1: String = ""
    @State private var digit2: String = ""
    @State private var digit3: String = ""
    @State private var digit4: String = ""
    @FocusState private var digit2IsFocused: Bool
    @FocusState private var digit3IsFocused: Bool
    @FocusState private var digit4IsFocused: Bool
    @State private var showSignUp = false
    
    @StateObject private var validateCodeViewModel = ValidateCodeViewModel()
    @State private var userId = ""
    @State private var code = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     var body: some View {
        VStack {
            Text("Completa tu registro")
                .font(.title)
                .padding()
            Spacer()
             HStack(spacing: 10) {
                TextField("", text: $digit1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                    .keyboardType(.numberPad)
                    .onReceive(Just(digit1)) { newValue in
                        if newValue.count > 1 {
                            let digits = Array(newValue)
                            digit1 = String(digits[0])
                            digit2 = String(digits[1])
                            digit3 = digits.count > 2 ? String(digits[2]) : ""
                            digit4 = digits.count > 3 ? String(digits[3]) : ""
                            DispatchQueue.main.async {
                                // Move focus to last TextField that has value
                                digit2IsFocused = digit3.isEmpty
                                digit3IsFocused = !digit2IsFocused && digit4.isEmpty
                                digit4IsFocused = !digit3IsFocused
                            }
                        }
                    }
                    .background(.blue)
                    .focused($digit2IsFocused)
                 TextField("", text: $digit2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                    .keyboardType(.numberPad)
                    .focused($digit3IsFocused)
                    .background(.blue)
                    .onReceive(Just(digit2)) { newValue in
                        if newValue.count > 1 {
                            digit2 = String(newValue.prefix(1))
                            digit3 = String(newValue.suffix(1))
                            
                        }
                    }
                 TextField("", text: $digit3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                    .keyboardType(.numberPad)
                    .background(.blue)
                    .focused($digit4IsFocused)
                    .onReceive(Just(digit3)) { newValue in
                         if newValue.count > 1 {
                             digit3 = String(newValue.prefix(1))
                             digit4 = String(newValue.suffix(1))
                             
                         }
                     }
                 TextField("", text: $digit4)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50)
                    .keyboardType(.numberPad)
                    .background(.blue)
            }
            .padding()
            
            Spacer()
             Button(action: {
                code = "\(digit1)\(digit2)\(digit3)\(digit4)"
                print("Verification Code: \(code)")
                // Perform verification code confirmation here
                 
                 validateCodeViewModel.validateCode(userId: userId, code: code)
                 
//                 showSignUp=true;
                 
            }) {
                Text("Confirmar")
                    .foregroundColor(.blue)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .font(.system(size: 25))
            }
            .fullScreenCover(isPresented: $showSignUp) {
                NavigationView{
                    SignUp()
                }
            }
            VStack {
                Text("Don't you receive code?")
//                    .font(.footnote)
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
                    .padding(.vertical)
                Button(action: {
                    // Perform resend code action here
                    validateCodeViewModel.resendCode(userId: userId)
                }) {
                    Text("Resend")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                }
                
            }
            .padding()
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.blue)
        })
        .alert(isPresented: $validateCodeViewModel.isCodeValidated) {
            Alert(
                title: Text("Code Validation Successful"),
                message: nil,
                dismissButton: .default(Text("OK"),action:{
                    showSignUp=true
                })
            )
        }
         
     }
    
}
struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VerifyCodeView()
        }
    }
}
