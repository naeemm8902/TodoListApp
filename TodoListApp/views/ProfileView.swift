//
//  ProfileView.swift
//  TodoListApp
//
//  Created by Wazir Naeem Ahmed on 12/08/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Profile Info
                    Form {
                        Section(header: Text("Profile Information")) {
                            // Profile Image
                            HStack {
                                Spacer()
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.blue)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                Spacer()
                            }
                            
                            // User Details
                            HStack {
                                Text("Name:")
                                Spacer()
                                Text(user.name)
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Text("Email:")
                                Spacer()
                                Text(user.email)
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Text("Member Since:")
                                Spacer()
                                Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Section {
                            // Logout Button
                            Button(action: {
                                viewModel.logOut()
                            }) {
                                HStack {
                                    Spacer()
                                    Text("Log Out")
                                        .foregroundColor(.red)
                                        .bold()
                                    Spacer()
                                }
                            }
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
