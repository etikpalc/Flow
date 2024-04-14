import SwiftUI

struct PixelButton: View {
    var body: some View {
        
            HStack{
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width:30)
               
                
            }
        }
    }

struct PixelButton_Previews: PreviewProvider {
    static var previews: some View {
        PixelButton()
    }
}
