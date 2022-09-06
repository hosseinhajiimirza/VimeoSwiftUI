#  Hi!

Please turn on your VPN before using the app.

In SwiftUI, We can bind everthing! We can use @Binding for some types like Int, String and ... . If we want to bind the viewModel, We should use @StateObject for the first view and for the next views we have two choices: 1. we use @ObservedObject if we want to bind it for a few views، it's common to use @ObservedObject, 2. but if we want to bind and share it in many views we should use @EnvironmentObject. if we use this property wrapper we should add .environmentObject modifier for this view and also for the preview. if we don't use it, xcode won't shows the preview.

I added a Custom Activity Indicator too, So when the user search something, an animation shows up until we get the data.

it's easy to use search bar on NavigationView. but we can only use List to have the .searchable modifier. it will be in iOS 16 and we can add .searchbale modifire to scrollView too. and also if we choose this way, sometimes we have a little bugs when we cancel the search.
So I created a custom SearchBar.

IMPORTANT: If we have different model and view model, every screens should have a Model, View, ViewModel. but in this project, we have only one view model(and another one for the videoPlayer) and our models our common. So there is no need to do that. And also in SwiftUI we name the views without saying the type. like Home. (Not HomeView or HomeVIewController in UIkit)

IMPORTANT: when I run the app on the simulator and I want to open the VideoDetails View, I see an empty view for the first time and i think there is a buf from simulator becuase when you change the appearance by command + A, you can see the right view.

I found this line on the console log and i think this is a bug from xcode. If you know why this is happening, I will be happy if you share it to me:
<CATransformLayer: 0x600003bafc20> - changing property masksToBounds in transform-only layer, will have no effect


