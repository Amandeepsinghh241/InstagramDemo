import SwiftUI
import FirebaseFirestore
import FirebaseCore

struct LoginView: View {
   
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView{
                VStack(spacing: 20) {
                    ScrollView{
                    VStack{
                        Image("Instagram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                    }
                    .padding(.bottom, 20)
                    
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                    
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    
                    if let error = errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.subheadline)
                    }
                    
                    Button(action: handleLogin) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Don't have an account?")
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                    }
                }
                .padding()
                
            }
                .padding(.top, 60)
        }
        }
    

    private func handleLogin() {
        // Simple validation
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password cannot be empty."
            return
        }

        // Dummy login logic
        if email == "test@example.com" && password == "password" {
            errorMessage = nil
            print("Login successful")
            // Navigate or update state here
        } else {
            errorMessage = "Invalid credentials"
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
