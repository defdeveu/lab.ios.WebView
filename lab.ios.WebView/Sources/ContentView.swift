import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 36) {
            Spacer()

            NavigationLink {
                SecondWebView()
            } label: {
                scenarioLabel("WKWebView")
            }

            Spacer()
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { appTitle() }
    }

    @ViewBuilder
    private func scenarioLabel(_ title: String) -> some View {
        Text(title)
            .font(.title2.bold())
            .foregroundStyle(AppColors.buttonText)
            .frame(width: 200)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(AppColors.buttonBorder, lineWidth: 2)
            )
    }

    @ToolbarContentBuilder
    private func appTitle() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                Image(.logoDddStamp1905)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundStyle(.primary)
                    .frame(width: 36, height: 36)
                    .accessibilityHidden(true)
                Text(AppStrings.appTitle)
                    .font(.title.bold())
                    .foregroundStyle(AppColors.navigationForeground)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
