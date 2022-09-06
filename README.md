# VimeoSwiftUI

You can search any videos from Vimeo and watch it on VimeoSwiftUI App!

# Notes

Please turn on your VPN before using the app.

In SwiftUI, We can bind everthing! We can use @Binding for some types like Int, String and ... . If we want to bind the viewModel, We should use @StateObject for the first view and for the next views we have two choices: 1. we use @ObservedObject if we want to bind it for a few views، it's common to use @ObservedObject, 2. but if we want to bind and share it in many views we should use @EnvironmentObject. if we use this property wrapper we should add .environmentObject modifier for this view and also for the preview. if we don't use it, xcode won't shows the preview.

I added a Custom Activity Indicator too, So when the user search something, an animation shows up until we get the data.
We can also add pageination, skeleton Animation for cells, and cash the images.

it's easy to use search bar on NavigationView. but we can only use List to have the .searchable modifier. it will be in iOS 16 and we can add .searchbale modifire to scrollView too. and also if we choose this way, sometimes we have a little bugs when we cancel the search.
So I created a custom SearchBar.

IMPORTANT: If we have different model and view model, every screens should have a Model, View, ViewModel. but in this project, we have only one view model(and another one for the videoPlayer) and our models our common. So there is no need to do that. And also in SwiftUI we name the views without saying the type. like Home. (Not HomeView or HomeVIewController in UIkit)

IMPORTANT: when I run the app on the simulator and I want to open the VideoDetails View, I see an empty view for the first time and i think there is a buf from simulator becuase when you change the appearance by command + A, you can see the right view.

I found this line on the console log and i think this is a bug from xcode. If you know why this is happening, I will be happy if you share it with me:
<CATransformLayer: 0x600003bafc20> - changing property masksToBounds in transform-only layer, will have no effect

I did not add the unit test and UI test files because I have no knowledge about testing ios apps.

# App Information:

Framework: SwiftUI
Compatibility: 
  iPhone 
  Requires iOS 15.0 or later
Architecture: MVVM
Dependencies: HCVimeoVideoExtractor(SPM)
Device Orientation: Portrait (Portrait + Landscape for Video Player)
Time spent: 1/2 days(1 day For working on animations, Colors and design)
Features: 
  1. Welcome Screen (Walkthrough Screen)
  2. Custom SearchBar + set delay
  3. Custom Activity Indicator
  4. Custom Animations
  5. Custom BackgroundView
  6. Support of both dark and light Mode
  7. Converting minutes to "hh:mm" format
  8. Load Images(thumbnail) with AsyncImage
  9. Using Async await 

# To Filimo

I have already done this project to search videos from Vimeo. I find it very similar to the task. so I didn't change the API because I think there is no difference(Except for the multi-language support of the app). but I can change it and call your API if you want.(Sorry for that) and also I can do this task with UIKit framework (with iOS target 13+). Here is how I would do it:
  1. MVC Architecture
  2. Create Views like CustomTableViewCell(without storyboard or with zib file) and adding constraints on 
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) { }, we can also make configureCell(model: Model) {} for cell configuration.
  3. Create Controllers:
     HomeViewController, SearchResultsViewController, and VideoDetailsViewController.
  4. to Create our tableView for SearchResultsViewController:
    A. Create an enum that conforms to hashable for our sections and itmes that is array of our model (items: [Model] = [])
    B. Create dataSource and snapshot:
    ```
    var dataSource: UITableViewDiffableDataSource<Section,Model>!
    var snapshot: NSDiffableDataSourceSnapshot<Section,Model>!
    ```
    C. Create Snapshot
    ```
    func createSnapshot() -> NSDiffableDataSourceSnapshot<Section,Model> {}
    ```
    D. DataSource Configuration
    ```
    func configureDataSource() {}
    ```
    and inside of our func: .init(tableView:cellProvider:)
    **
    if we wanted to use CollectionView, We should also called another func to generate layout. and also if we wanted to build something like appStore we can use UICollectionViewCompositionalLayout and create our custom cells, SupplementaryViewKind, headers and ...
  5. we can change the language locally or in the settings app. to add new language:
     A. We can create Localizable.strings files for each Screen (or we can set two zib files) and define our keys.
     B. We can create an extension for String to read the keys from bundle and create our NSLocalizedString:
     
    ```
    extension String {
       func addLocalizableString(language: String) -> String {
          let path = Bundle.main.path(forResource: language, ofType: "lproj")
          let bundle = Bundle(path: path!)
        
          return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
        }
    }

    ```
