//
//  UserStore.swift
//  EnableLocationScreen
//
//  Created by Swastik Mandal on 26/02/26.
//

import Foundation
import Combine

struct RegisteredUser: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var username: String
    var password: String
}

class UserStore: ObservableObject {

    static let shared = UserStore()

    @Published private(set) var users: [RegisteredUser] = []

    private let fileURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)[0]
        return docs.appendingPathComponent("users.json")
    }()

    private init() {
        load()
    }

    func register(firstName: String,
                  lastName: String,
                  email: String,
                  username: String,
                  password: String) -> String? {

        if firstName.trimmingCharacters(in: .whitespaces).isEmpty ||
           email.trimmingCharacters(in: .whitespaces).isEmpty ||
           username.trimmingCharacters(in: .whitespaces).isEmpty ||
           password.isEmpty {
            return "Please fill in all required fields."
        }

        let emailLower    = email.lowercased()
        let usernameLower = username.lowercased()
        if users.contains(where: {
            $0.email.lowercased() == emailLower ||
            $0.username.lowercased() == usernameLower
        }) {
            return "An account with this email or username already exists."
        }

        let newUser = RegisteredUser(firstName: firstName,
                                     lastName: lastName,
                                     email: email,
                                     username: username,
                                     password: password)
        users.append(newUser)
        save()
        return nil
    }

    func validateLogin(identifier: String, password: String) -> String? {
        let id = identifier.lowercased()
        guard let user = users.first(where: {
            $0.email.lowercased() == id || $0.username.lowercased() == id
        }) else {
            return "No account found with that email or username."
        }

        guard user.password == password else {
            return "Incorrect password. Please try again."
        }

        return nil
    }

    private func load() {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        do {
            let data = try Data(contentsOf: fileURL)
            users = try JSONDecoder().decode([RegisteredUser].self, from: data)
        } catch {
            print("UserStore: failed to load – \(error)")
        }
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("UserStore: failed to save – \(error)")
        }
    }
}

