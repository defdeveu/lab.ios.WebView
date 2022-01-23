import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 36) {
            Spacer()

            NavigationLink(destination: SecondWebView(),
                           label: { scenarioLabel("WKWebView") })

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
            .foregroundColor(AppColors.buttonText)
            .frame(width: 200)
            .padding()
            .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AppColors.buttonText, lineWidth: 2)
                )
    }

    @ToolbarContentBuilder
    private func appTitle() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                AppImages.appTitleImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .colorInvert()
                // TODO colorInvert as per the scheme
                Text(AppStrings.appTitle)
                    .font(.title.bold())
                    .foregroundColor(AppColors.navigationForeground)
            }
            .padding(.bottom, 8)
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
