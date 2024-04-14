import SwiftUI

struct MiniButton: View {
    
    @State private var isTapped = false
    
    var body: some View {
     
            ZStack {
                if isTapped {
                    VStack {
                        HStack {
                            NavigationLink(value: "Pink") {
                                Color.pink
                                    .clipShape(Rectangle())
                                    .frame(width: 40, height: 40)
                            }
                            NavigationLink(value: "Yellow") {
                                Color.yellow
                                    .clipShape(Rectangle())
                                    .frame(width: 40, height: 40)
                            }
                        }
                        HStack {
                            NavigationLink(value: "Orange") {
                                Color.orange
                                    .clipShape(Rectangle())
                                    .frame(width: 40, height: 40)
                            }
                            
                            NavigationLink(value: "Cyan") {
                                Color.cyan
                                    .clipShape(Rectangle())
                                    .frame(width: 40, height: 40)
                            }
                        }
                        HStack {
                            NavigationLink(value: "Blue") {
                                Color.blue
                                    .clipShape(Rectangle())
                                    .frame(width: 40, height: 40)
                            }
                        }
                    }
                    .navigationDestination(for: String.self) { name in
                        switch name {
                        case "pink", "yellow", "orange", "cyan", "blue" :
                        MiniButton()
                        default:
                            Text("HomeView??")
                        }
                    }
                }
        }
    }
}
