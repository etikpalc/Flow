import SwiftUI

struct FuView: View {
    @State private var isButtonTapped = false // 버튼 클릭 여부를 나타내는 상태 변수
    @State private var isButtonMoved = false // 버튼 이동 여부를 나타내는 상태 변수
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView{
                    VStack {
                        Text("Year in Pixels")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding(.trailing, 128)
                        
                        Text("Life is full of emotion--!")
                            .foregroundColor(.white)
                            .padding(.trailing, 148)
                            .padding(.bottom, 12)
                        
                        Button(action: {
                            // PixelView로 이동하는 NavigationLink를 추가합니다.
                        }) {
                            NavigationLink(destination: PixelView()) {
                                Image("square")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 700, height: 140) // 이미지 크기 조정
                                    .padding(.top, -4)
                            }
                        }
                        
                        Image("waving")
                            .padding(.top, 42)
                            .padding(.bottom, -36)
                        
                        VStack{
                            Text("HOW MUCH DO YOU WANT TO DO?")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(width:378, height: 200)
                                .font(.system(size: 40))
                                .bold()
                                .padding(.bottom, -24)
                            
                            ZStack {
                                Button(action: {
                                }) {
                                    NavigationLink(destination: WriteView()) {
                                        
                                        RoundedRectangle(cornerRadius: 60)
                                            .fill(Color.gray)
                                            .frame(width:378, height: 100)
                                            .offset(y: isButtonMoved ? 200 : 0)
                                    }
                                }
                                
                                HStack {
                                    Button(action: {
                                        isButtonTapped.toggle() // 버튼 클릭 상태 변경
                                        isButtonMoved.toggle() // 버튼 이동 상태 변경
                                    }) {
                                        Circle()
                                            .foregroundColor(isButtonTapped ? .blue : .white) // 클릭 여부에 따라 색상 변경
                                            .frame(width:90)
                                            .overlay(
                                                Image(systemName: "checkmark")
                                                    .foregroundColor(.black)
                                            )
                                            .padding(.trailing,10)
                                            .offset(y: isButtonMoved ? 200 : 0)
                                    }
                                    
                                    Text("Create a non - Hence account")
                                        .foregroundColor(.black)
                                        .offset(y: isButtonMoved ? 200 : 0)
                                        .padding(.trailing,30)
                                    
                                }
                            }
                            .padding(.top, -16)
                            .padding(.bottom, 24)
                        }
                        
                        VStack{
                            Spacer() // "I DID THIS MUCH-!" 텍스트 위의 여백을 조정하기 위해 Spacer를 추가합니다.
                            
                            Button(action: {
                                isButtonTapped.toggle() // 버튼 클릭 상태 변경
                                isButtonMoved.toggle() // 버튼 이동 상태 변경
                            }) {
                                Text("I DID THIS MUCH-!")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true) // PixelView로 이동할 때 네비게이션 바 숨기기
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FuView_Previews: PreviewProvider {
    static var previews: some View {
        FuView()
    }
}
