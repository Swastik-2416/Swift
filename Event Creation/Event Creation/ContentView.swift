//
//  ContentView.swift
//  Event Creation
//
//  Created by Swastik Mandal on 05/03/26.
//

import SwiftUI
import PhotosUI
//import CoreLocation

struct ContentView: View {
    @State private var eventName = ""
        @State private var eventType = ""
        @State private var selectedTypes: [String] = []
        
        @State private var selectedItem: PhotosPickerItem? = nil
        @State private var selectedImageData: Data? = nil
        
        @State private var date = Date()
        @State private var time = Date()
        @State private var dateSelected = false
        @State private var timeSelected = false
        @State private var showDatePicker = false
        @State private var showTimePicker = false
        
        @State private var hours = 0
        @State private var minutes = 0
        
        @State private var location = ""
        @State private var description = ""
        
//        @State private var locationManager = CLLocationManager()
        
        var body: some View {
            ZStack {
                ScrollView {
                    VStack(spacing: 22) {
                        Text("Create New Event")
                            .font(.title).bold()
                            .foregroundStyle(.appPrimary)
                        
                        // Image Picker
                        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                            ZStack {
                                Circle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 110, height: 110)
                                    .glassEffect()
                                
                                if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 110, height: 110)
                                        .clipShape(Circle())
                                } else {
                                    Image(systemName: "camera")
                                        .font(.title)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .task(id: selectedItem) {
                            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                        
                        // Event Name
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Event Name")
                                .fontWeight(.semibold)
                            
                            TextField("Enter event name...", text: $eventName)
                                .padding()
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(20)
                        }
                        
                        // Event Type
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Event Type")
                                .fontWeight(.semibold)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(selectedTypes, id: \.self) { type in
                                        HStack {
                                            Text(type)
                                                .foregroundColor(.white)
                                            
                                            Button {
                                                selectedTypes.removeAll { $0 == type }
                                            } label: {
                                                Image(systemName: "xmark")
                                                    .font(.caption)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.orange)
                                        .cornerRadius(20)
                                    }
                                }
                            }
                            
                            HStack {
                                TextField("Enter event type...", text: $eventType)
                                    .padding()
                                    .background(Color.gray.opacity(0.15))
                                    .cornerRadius(20)
                                
                                Button {
                                    if !eventType.isEmpty {
                                        selectedTypes.append(eventType)
                                        eventType = ""
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.orange)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        
                        // Date & Time
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Date & Time")
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 16) {
                                // Date Button
                                Button {
                                    showDatePicker = true
                                } label: {
                                    HStack {
                                        Image(systemName: "calendar")
                                            .foregroundColor(dateSelected ? .primary : .gray)
                                        Text(dateSelected ? date.formatted(date: .abbreviated, time: .omitted) : "Select Date")
                                            .foregroundColor(dateSelected ? .primary : .gray)
                                    }
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.gray.opacity(0.15))
                                    .cornerRadius(20)
                                }
                                
                                // Time Button
                                Button {
                                    showTimePicker=true
                                } label: {
                                    HStack {
                                        Image(systemName: "clock")
                                            .foregroundColor(timeSelected ? .primary : .gray)
                                        Text(timeSelected ? time.formatted(date: .omitted, time: .shortened) : "Select Time")
                                            .foregroundColor(timeSelected ? .primary : .gray)
                                    }
                                    .padding(.horizontal)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(Color.gray.opacity(0.15))
                                    .cornerRadius(20)
                                }
                            }
                        }
                        
                        // Duration
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Duration")
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 12) {
                                // Hours
                                HStack(spacing: 12) {
                                    Button {
                                        if hours > 0 { hours -= 1 }
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(.body.weight(.semibold))
                                            .foregroundColor(.primary)
                                            .frame(width: 25, height: 25)
                                            .background(Color.gray.opacity(0.25))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                    
                                    Text("\(hours)  Hours")
                                        .fontWeight(.medium)
                                    
                                    Button {
                                        if hours < 24 { hours += 1 }
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.body.weight(.semibold))
                                            .foregroundColor(.primary)
                                            .frame(width: 25, height: 25)
                                            .background(Color.gray.opacity(0.25))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                                .frame(width: 155)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 14)
                                .background(Color.gray.opacity(0.12))
                                .cornerRadius(20)
                                
                                
                                // Minutes
                                HStack(spacing: 12) {
                                    Button {
                                        if minutes > 0 { minutes -= 1 }
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(.body.weight(.semibold))
                                            .foregroundColor(.primary)
                                            .frame(width: 25, height: 25)
                                            .background(Color.gray.opacity(0.25))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                    
                                    Text("\(minutes)  Minutes")
                                        .fontWeight(.medium)
                                    
                                    Button {
                                        if minutes < 59 { minutes += 1 }
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.body.weight(.semibold))
                                            .foregroundColor(.primary)
                                            .frame(width: 25, height: 25)
                                            .background(Color.gray.opacity(0.25))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                                .frame(width:175)
                                .padding(.horizontal, 1)
                                .padding(.vertical, 14)
                                .background(Color.gray.opacity(0.12))
                                .cornerRadius(20)
                            }
                        }
                        
                        // Location
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Location")
                                .fontWeight(.semibold)
                            
                            HStack {
                                TextField("Enter event location...", text: $location)
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "location.fill")
                                        .foregroundColor(.blue)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.15))
                            .cornerRadius(20)
                        }
                        
                        // Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Description")
                                .fontWeight(.semibold)
                            
                            TextEditor(text: $description)
                                .scrollContentBackground(.hidden)
                                .frame(height: 100)
                                .padding(6)
                                .background(Color.gray.opacity(0.15))
                                .cornerRadius(20)
                        }
                        
                        // Create Button
                        Button {
                        } label: {
                            Text("Create Event")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.appPrimary)
                                .cornerRadius(30)
                        }
                        
                    }
                    .padding()
                }
                
                // Date Picker Popup
                if showDatePicker {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                dateSelected = true
                                showDatePicker = false
                            }
                        }
                    
                    VStack(spacing: 16) {
                        Text("Select Date")
                            .font(.headline)
                        
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .labelsHidden()
                        
                        Button("Done") {
                            withAnimation {
                                dateSelected = true
                                showDatePicker = false
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.appPrimary)
                        .cornerRadius(20)
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding(24)
                    .transition(.scale.combined(with: .opacity))
                }
                
                // Time Picker Popup
                if showTimePicker {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                timeSelected = true
                                showTimePicker = false
                            }
                        }
                    
                    VStack(spacing: 16) {
                        Text("Select Time")
                            .font(.headline)
                        
                        DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                        
                        Button("Done") {
                            withAnimation {
                                timeSelected = true
                                showTimePicker = false
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.appPrimary)
                        .cornerRadius(20)
                    }
                    .padding()
                    .background(.regularMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .padding()
                    .transition(.scale.combined(with: .opacity))
                }
            }
        }
}

#Preview {
    ContentView()
}
