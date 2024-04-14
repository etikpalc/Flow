import SwiftUI

struct CustomTapView: View {
    
    @State private var selectedTab = 0
    
    enum TabbedItems: Int, CaseIterable {
        case home = 0
        case past = 1
        case future = 2
        
        var title: String {
            switch self {
            case .home:
                return "Home"
            case .past:
                return "Past"
            case .future:
                return "Future"
            }
        }
        
        var iconName: String {
            switch self {
            case .home:
                return "rectangle.fill"
            case .past:
                return "rectangle.split.2x2.fill"
            case .future:
                return "rectangle.split.3x3.fill"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                Color.black.edgesIgnoringSafeArea(.all) // 전체를 검정 배경으로 덮기
                
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                    
                    PastView()
                        .tag(1)
                    
                    FuView()
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                HStack {
                    ZStack{
                        HStack(spacing: 20){ // 적절한 간격으로 수정
                            ForEach(TabbedItems.allCases, id: \.self) { item in
                                Button {
                                    selectedTab = item.rawValue
                                } label: {
                                    CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                                }
                            }
                        }
                        .padding(6)
                    }
                    .frame(height: 76)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(40)
                    
                    NavigationLink(destination: WriteView()) {
                        CircleButton()
                            .padding()
                    }
                }
            }
        }
    }
    
    struct CustomTabItem: View {
        var imageName: String
        var title: String
        var isActive: Bool
        
        var body: some View {
            HStack(spacing: 10) {
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? .blue : .gray)
                    .frame(width: 22, height: 22)
                Spacer()
            }
            .frame(width: isActive ? 60 : 60, height: 60)
            .cornerRadius(30)
        }
    }
    
    struct CircleButton: View {
        var body: some View {
            Image(systemName: "pencil.tip")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 36, height: 36)
                .padding(20)
                .background(Color.white)
                .opacity(0.9)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTapView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro"))
    }
}
