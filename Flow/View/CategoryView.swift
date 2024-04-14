import SwiftUI

struct CategoryView: View {
    var color: Color
    var title: String
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 3)
                .fill(color)
                .frame(width: 40, height: 40)
            Text(title)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}
