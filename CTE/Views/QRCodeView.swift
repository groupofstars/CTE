import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI
//struct QRCodeView: View {
//    var text = "Lin Li "
//    init(passedString: String) {
//           self.text = passedString
//    }
//    var body: some View {
////        NavigationStack {
////            VStack {
////                TextField("Enter code", text: $text)
////                    .textFieldStyle(.roundedBorder)
////                    .padding()
//
//                Image(uiImage: UIImage(data: generateQR(text: text)!)!)
////                    .resizable()
////                    .frame(width: 200, height: 200)
////            }
////            .navigationTitle("QR code")
////        }
//    }
    func generateQR(text: String) -> Data? {
        let filter = CIFilter.qrCodeGenerator()
        guard let data = text.data(using: .ascii, allowLossyConversion: false) else { return nil }
        filter.message = data
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
//}
//struct QRCodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            QRCodeView(passedString: "Q")
//        }
//    }
//}
