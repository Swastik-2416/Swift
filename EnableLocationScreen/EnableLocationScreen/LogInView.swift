//
//  LoginInView.swift
//  EnableLocationScreen
//
//  Created by Swastik Mandal on 24/02/26.
//

import SwiftUI

struct LogInView: View {
    @State private var identifier = ""
    @State private var password   = ""
    @State private var isSecure   = true

    @State private var isSignedIn          = false
    @State private var isSignedInWithApple = false
    @State private var isSignUp            = false
    @State private var isForgotPassword    = false

    @State private var alertMessage = ""
    @State private var showAlert    = false

    var body: some View {
        VStack {
            VStack(spacing: 8) {
                Text("Login")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
            }

            VStack(spacing: 20) {

                VStack(alignment: .leading, spacing: 6) {
                    Text("Email or Username")
                        .font(.subheadline.bold())
                        .foregroundColor(.appPrimary)
                        .padding(.bottom, 3)

                    TextField(
                        "",
                        text: $identifier,
                        prompt: Text("Enter your email or username")
                            .foregroundColor(.gray.opacity(0.7))
                            .font(.subheadline)
                    )
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .foregroundColor(.black)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Password")
                        .font(.subheadline.bold())
                        .foregroundColor(.appPrimary)
                        .padding(.bottom, 3)

                    HStack {
                        Group {
                            if isSecure {
                                SecureField(
                                    "",
                                    text: $password,
                                    prompt: Text("Enter your password")
                                        .foregroundColor(.gray.opacity(0.7))
                                        .font(.subheadline)
                                )
                                .foregroundColor(.black.opacity(0.7))
                            } else {
                                TextField(
                                    "",
                                    text: $password,
                                    prompt: Text("Enter your password")
                                        .foregroundColor(.gray.opacity(0.7))
                                )
                                .foregroundColor(.black.opacity(0.7))
                            }
                        }
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isSecure.toggle()
                            }
                        } label: {
                            Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.appPrimary)
                        }
                    }
                    .padding(10)
                    .background(.white)
                    .cornerRadius(15)
                }

                HStack {
                    Button("Forgot Password?") {
                        isForgotPassword = true
                    }
                    .font(.footnote.bold())
                    .foregroundColor(.appPrimary)
                    Spacer()
                }

                Button {
                    handleLogin()
                } label: {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.appPrimary)
                        .cornerRadius(30)
                }
                .foregroundColor(.white)
                .padding(.top, 5)

                HStack {
                    Rectangle()
                        .fill(Color.white.opacity(0.8))
                        .frame(height: 1)
                    Text("OR")
                        .font(.footnote)
                        .foregroundColor(.black)
                    Rectangle()
                        .fill(Color.white.opacity(0.8))
                        .frame(height: 1)
                }
                .padding(.horizontal)

                Button {
                    isSignedInWithApple = true
                } label: {
                    HStack {
                        Image(systemName: "apple.logo")
                            .foregroundStyle(.black)
                        Text("Sign In with Apple")
                            .fontWeight(.semibold)
                            .foregroundColor(.appPrimary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                }
                .cornerRadius(30)

                HStack {
                    Spacer()
                    Text("Don't have an Account?")
                        .font(.subheadline)
                    Button {
                        isSignUp = true
                    } label: {
                        Text("Sign Up")
                            .font(.subheadline)
                            .foregroundColor(.appPrimary)
                    }
                    Spacer()
                }
                .padding(10)
            }
            .frame(width: 320, height: .infinity)
            .padding(25)
            .glassEffect(in: .rect(cornerRadius: 20))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [.topGradient, .bottomGradient],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea()
        .alert("Sign In Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    // MARK: - Login Logic

    private func handleLogin() {
        guard !identifier.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.isEmpty else {
            alertMessage = "Please enter your email/username and password."
            showAlert    = true
            return
        }

        if let error = UserStore.shared.validateLogin(identifier: identifier,
                                                       password: password) {
            alertMessage = error
            showAlert    = true
        } else {
            isSignedIn = true
        }
    }
}

#Preview {
    LogInView()
}
