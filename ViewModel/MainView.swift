import SwiftUI


struct mainview: View {
    var body: some View {
        VStack{
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                        
                    }
                
                ChatView()
                    .tabItem {
                        Label("Chat", systemImage: "message")
                        
                    }
                
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle")
                        
                    }
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                        
                    }
                
            }
            .tint(.green)
            
        }
    }
}



