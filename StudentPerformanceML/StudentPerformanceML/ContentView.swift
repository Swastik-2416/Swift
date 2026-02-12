//
//  ContentView.swift
//  StudentPerformanceML
//
//  Created by Swastik Mandal on 11/02/26.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var hoursStudied: Int = 1
    @State private var sleepHours: Int = 1
    @State private var QPsolved: Int = 1
    @State private var previousScore: Int = 1
    @State private var cocurricular: Bool = false

    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    // Prepared values for model input
    private var hoursStudiedDouble: Double { Double(hoursStudied) }
    private var sleepHoursDouble: Double { Double(sleepHours) }
    private var QPsolvedDouble: Double { Double(QPsolved) }
    private var previousScoreDouble: Double { Double(previousScore) }
    private var cocurricularString: String { cocurricular ? "Yes" : "No" }

    private func submit() {
        // Use prepared values for ML or networking
        print("Submitting prepared inputs:")
        print("hoursStudied (Double) = \(hoursStudiedDouble)")
        print("sleepHours (Double) = \(sleepHoursDouble)")
        print("QPsolved (Double) = \(QPsolvedDouble)")
        print("previousScore (Double) = \(previousScoreDouble)")
        print("cocurricular (String) = \(cocurricularString)")

        // Attempt prediction with the Core ML model
        guard let model else {
            print("Model failed to load.")
            return
        }
        print(model.model.modelDescription)
        do {
            let output = try model.prediction(
                Hours_Studied: Int64(hoursStudied),
                Previous_Scores: Int64(previousScore),
                Extracurricular_Activities: cocurricularString,
                Sleep_Hours: Int64(sleepHours),
                Sample_Question_Papers_Practiced: Int64(QPsolved)
            )

            // Extract a numeric performance value via MLFeatureProvider (no KVC to avoid unrecognized selector crashes)
            var performanceValue: Double?

            if let provider = output as? MLFeatureProvider {
                let names = provider.featureNames
                print("Available output feature names: \(names)")

                // Try to find a likely numeric output by heuristic on the feature names
                let preferredOrder = [
                    "Performance_Index",
                    "performanceIndex",
                    "performance",
                    "score",
                    "target",
                    "output"
                ]

                // Choose the first matching name from our preferred list, otherwise fallback to any numeric feature
                let selectedName = preferredOrder.first(where: { names.contains($0) }) ??
                    names.first(where: { name in
                        // Prefer names that hint at a numeric prediction
                        name.localizedCaseInsensitiveContains("performance") ||
                        name.localizedCaseInsensitiveContains("index") ||
                        name.localizedCaseInsensitiveContains("score") ||
                        name.localizedCaseInsensitiveContains("target") ||
                        name.localizedCaseInsensitiveContains("output")
                    }) ?? names.first

                if let selectedName, let feature = provider.featureValue(for: selectedName) {
                    switch feature.type {
                    case .double:
                        performanceValue = feature.doubleValue
                    case .int64:
                        performanceValue = Double(feature.int64Value)
                    case .multiArray:
                        // If the model returns a single-value MLMultiArray, extract first element
                        if let array = feature.multiArrayValue, array.count == 1 {
                            performanceValue = array[0].doubleValue
                        }
                    default:
                        break
                    }
                }
            } else {
                print("Output does not conform to MLFeatureProvider; cannot introspect features.")
            }

            if let performanceValue {
                let formatted = String(format: "%.2f", performanceValue)
                alertMessage = "Predicted Performance Index: \(formatted)"
            } else {
                // As a last resort, show a generic success and dump the output type for debugging
                alertMessage = "Prediction complete. Unable to locate a numeric performance value. Check generated output type."
                print("Output type: \(type(of: output))")
            }
            showAlert = true
        } catch {
            print("Prediction failed with error: \(error)")
            alertMessage = "Prediction failed: \(error.localizedDescription)"
            showAlert = true
        }
    }
    private let model = try? StudentPerformancePrediction_1(configuration: MLModelConfiguration())

    var body: some View {
        NavigationStack {
            Form {
                Section("Study & Rest") {
                    Stepper(value: $hoursStudied, in: 1...12) {
                        HStack {
                            Text("Hours Studied")
                            Spacer()
                            Text("\(hoursStudied)")
                                .foregroundStyle(.secondary)
                        }
                    }

                    Stepper(value: $sleepHours, in: 1...12) {
                        HStack {
                            Text("Sleep Hours")
                            Spacer()
                            Text("\(sleepHours)")
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Section("Practice & Scores") {
                    Stepper(value: $QPsolved, in: 1...12) {
                        HStack {
                            Text("Question Papers Solved")
                            Spacer()
                            Text("\(QPsolved)")
                                .foregroundStyle(.secondary)
                        }
                    }

                    Stepper(value: $previousScore, in: 1...100) {
                        HStack {
                            Text("Previous Score")
                            Spacer()
                            Text("\(previousScore)")
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Section("Activities") {
                    Toggle(isOn: $cocurricular) {
                        Text("Cocurricular")
                    }
                }
                
                Section {
                    Button(action: submit) {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Student Inputs")
            .alert("Performance", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
}

#Preview {
    ContentView()
}
