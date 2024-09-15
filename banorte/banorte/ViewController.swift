import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Logo Image
            Image("banorte_logo") // You should add the logo image to your assets with the name "banorte_logo"
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 100)
                .padding(.top, 100)
            
            Spacer()
            
            // Login Button
            Button(action: {
                // Add action for login
            }) {
                Text("INICIAR SESIÓN")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            
            // New Client Button
            Button(action: {
                // Add action for new client
            }) {
                Text("NUEVO CLIENTE")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            
            Spacer()
        }
        .background(Color.red.ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
