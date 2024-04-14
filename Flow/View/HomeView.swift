import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack {
                    Text("A Life that Flows Naturally like Water-~")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 24)
                        .padding(.trailing, 24)
                    
                    // 버튼으로 물결 GIF 추가
                    Button(action: {
                        // 버튼을 클릭할 때 실행할 액션 추가
                    }) {
                        GifImage("wave")
                            .frame(width: 346, height: 140)
                    }
                    .padding(.bottom, 12)
                    
                    Text("Diary")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.trailing, 284)
                    
                    // WriteView로 이동하는 버튼
                    NavigationLink(destination: WriteView()) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.dgray)
                            .frame(width:346, height: 80)
                    }

                }
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
