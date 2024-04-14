import SwiftUI

struct PastView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("Self-Reflection")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    Text("Everything has a good reason!")
                        .foregroundColor(.white)
                        .padding(.bottom, 16)
                    
                    Image(.squares)
                    
                    ZStack {
                        VStack{
                            NavigationLink(destination: WriteView()) {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.dgray)
                                    .frame(width:348, height: 128)
                            }
                        }
                        
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: 2, height: .infinity)
                    }
                }
            }
        }
        .navigationBarTitle("", displayMode: .inline) // NavigationBar의 제목을 숨김
    }
}


struct PastView_Previews: PreviewProvider {
    static var previews: some View {
        PastView()
    }
}
