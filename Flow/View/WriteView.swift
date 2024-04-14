import SwiftUI

struct WriteView: View {
    @State private var memoText: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all) // 모든 배경을 검은색으로 설정
                
                VStack {
                    TextEditor(text: $memoText)
                            .foregroundColor(.white)
                        .font(.system(size: 24))
                }
            }
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
