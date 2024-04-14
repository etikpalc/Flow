import SwiftUI

struct MemoModel: Identifiable, Hashable {//프로토콜
    var id = UUID()
    
    let index: Int//변수, 상수, 변수명,타입
    var name: String
    let color: Color
    var fontSize: CGFloat
}
