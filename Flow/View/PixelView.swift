import SwiftUI

struct PixelView: View {
    @State private var selectedColors: [[Color]] = Array(repeating: Array(repeating: .gray, count: 12), count: 31) // 선택된 색상을 나타내는 이중 배열
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    Text("Year in Pixels")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    // 감정 카테고리
                    HStack(spacing: 4) {
                        CategoryView(color: .pink, title: "HAPPY")
                        CategoryView(color: .yellow, title: "SOSO")
                        CategoryView(color: .orange, title: "TIRED")
                        CategoryView(color: .cyan, title: "SAD")
                        CategoryView(color: .blue, title: "ANGRY")
                    }
                    .padding(.vertical, 4)
                    
                    // 월별 레이아웃
                    MonthView()
                    
                    HStack {
                        // 1일부터 31일까지의 숫자를 표시
                        VStack(spacing: 4) {
                            ForEach(1...31, id: \.self) { day in
                                Text("\(day)")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 24, height: 24)
                            }
                        }
                        .padding(.trailing, 4)
                        
                        VStack(spacing: 4) {
                            ForEach(0..<31) { dayIndex in
                                HStack(spacing: 4) {
                                    ForEach(0..<12) { monthIndex in
                                        Button(action: {
                                            // 버튼이 클릭되었을 때 해당 버튼의 색상을 변경
                                            selectedColors[dayIndex][monthIndex] = [Color.pink, Color.yellow, Color.orange, Color.cyan, Color.blue][Int.random(in: 0..<5)]
                                        }) {
                                            Rectangle()
                                                .foregroundColor(selectedColors[dayIndex][monthIndex])
                                                .frame(width: 24, height: 24)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

// 감정 카테고리 표시용 뷰
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

struct MonthView: View {
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        HStack {
            ForEach(months, id: \.self) { month in
                Text(String(month.prefix(1)))
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(.bottom, -12)
            }
        }
        .padding(.leading, 24)
    }
}

struct PixelView_Previews: PreviewProvider {
    static var previews: some View {
        PixelView()
    }
}
