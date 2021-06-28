import SwiftUI
import Firebase
struct ContentView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
	
	NavigationView {
		     List {
			   Label("Books", systemImage: "book.closed")
			   Label("Tutorials", systemImage: "list.bullet.rectangle")
			   Label("Video Tutorials", systemImage: "tv")
			   Label("Contacts", systemImage: "mail.stack")
			   Label("Search", systemImage: "magnifyingglass")
		     }
		     .listStyle(SidebarListStyle())
		     .navigationTitle("Code")
	}
	VStack{
		Menu {
			     Button("Cancel", action: {})
			     Button("Search", action: {})
			     Button("Add", action: {})
			 } label: {
			     Label("Create", systemImage: "plus.circle")
			 }
	}
        VStack {
		
            
            Image("Dominic Thiem")
                .clipShape(Circle())
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button(action: { login() }) {
                Text("Sign in")
            }
        }
        .padding()
        Text("Mot de passe oublié")
        .padding()
        Text("Hello la famille j'espere que vous allez bien")
        Label("Options", systemImage: "paperplane")
        
    }
   
    
   

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
}
