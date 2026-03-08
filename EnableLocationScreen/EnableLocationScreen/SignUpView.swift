//
//  SignUpView.swift
//  EnableLocationScreen
//
//  Created by Swastik Mandal on 25/02/26.
//

import SwiftUI

struct SignUpView: View {
    @State private var fName = ""
    @State private var lName = ""
    @State private var email = ""
    @State private var userName = ""
    @State private var createPassword = ""
    @State private var confirmPassword = ""
    @State private var isSecure = true

    @State private var isSignedUpWithApple = false
    @State private var isSignUp = false

    // Alert state
    @State private var alertMessage = ""
    @State private var showAlert = false
    @State private var didSucceed = false

    var body: some View {
        VStack {
            VStack {
                Text("Sign Up")
                    .font(.largeTitle).bold()
                    .foregroundColor(.white)
            }
            VStack(spacing: 15) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("First Name")
                            .font(.subheadline.bold())
                            .foregroundColor(.appPrimary)
                            .padding(.bottom, 3)

                        TextField(
                            "",
                            text: $fName,
                            prompt: Text("First Name")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.subheadline)
                        )
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Last Name")
                            .font(.subheadline.bold())
                            .foregroundColor(.appPrimary)
                            .padding(.bottom, 3)

                        TextField(
                            "",
                            text: $lName,
                            prompt: Text("Last Name")
                                .foregroundColor(.gray.opacity(0.7))
                                .font(.subheadline)
                        )
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                    }
                    Spacer()
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Email")
                        .font(.subheadline.bold())
                        .foregroundColor(.appPrimary)
                        .padding(.bottom, 3)

                    TextField(
                        "",
                        text: $email,
                        prompt: Text("Enter your email")
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
                    Text("User Name")
                        .font(.subheadline.bold())
                        .foregroundColor(.appPrimary)
                        .padding(.bottom, 3)

                    TextField(
                        "",
                        text: $userName,
                        prompt: Text("Enter your username")
                            .foregroundColor(.gray.opacity(0.7))
                            .font(.subheadline)
                    )
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    .foregroundColor(.black)
                }

                VStack(alignment: .leading, spacing: 6) {
                    Text("Create Password")
                        .font(.subheadline.bold())
                        .foregroundColor(.appPrimary)
                        .padding(.bottom, 3)

                    HStack {
                        Group {
                            if isSecure {
                                SecureField(
                                    "",
                                    text: $createPassword,
                                    prompt: Text("Enter your password")
                                        .foregroundColor(.gray.opacity(0.7))
                                        .font(.subheadline)
                                )
                                .foregroundColor(.black.opacity(0.7))
                            } else {
                                TextField(
                                    "",
                                    text: $createPassword,
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

                VStack(alignment: .leading, spacing: 6) {
                    Text("Confirm Password")
                        .font(.subheadline.bold())
                        .foregroundColor(.appPrimary)
                        .padding(.bottom, 3)

                    HStack {
                        Group {
                            if isSecure {
                                SecureField(
                                    "",
                                    text: $confirmPassword,
                                    prompt: Text("Confirm your password")
                                        .foregroundColor(.gray.opacity(0.7))
                                        .font(.subheadline)
                                )
                                .foregroundColor(.black.opacity(0.7))
                            } else {
                                TextField(
                                    "",
                                    text: $confirmPassword,
                                    prompt: Text("Confirm your password")
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

                Button {
                    handleSignUp()
                } label: {
                    Text("Create Account")
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
                    isSignedUpWithApple = true
                } label: {
                    HStack {
                        Image(systemName: "apple.logo")
                            .foregroundStyle(.black)
                        Text("Sign Up with Apple")
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
                    Text("Already have an account?")
                        .font(.subheadline)
                    Button {
                        isSignUp = true
                    } label: {
                        Text("Sign In")
                            .font(.subheadline)
                            .foregroundColor(.appPrimary)
                    }
                    Spacer()
                }
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
        .alert(didSucceed ? "Account Created Succesfully" : "Sign Up Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    
    
    private func handleSignUp() {
        guard createPassword == confirmPassword else {
            alertMessage = "Passwords do not match. Please try again."
            didSucceed   = false
            showAlert    = true
            return
        }

        guard createPassword.count >= 6 else {
            alertMessage = "Password must be at least 6 characters."
            didSucceed   = false
            showAlert    = true
            return
        }

        if let error = UserStore.shared.register(
            firstName: fName,
            lastName:  lName,
            email:     email,
            username:  userName,
            password:  createPassword
        ) {
            alertMessage = error
            didSucceed   = false
        } else {
            alertMessage = "Welcome, \(fName)! You can now sign in with your email or username."
            didSucceed   = true
            fName           = ""
            lName           = ""
            email           = ""
            userName        = ""
            createPassword  = ""
            confirmPassword = ""
        }
        showAlert = true
    }
}

#Preview {
    SignUpView()
}
