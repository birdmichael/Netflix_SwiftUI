---
typora-root-url: ./Screenshot
---

# Netflix_SwiftUI

Home:

![home](/home.gif)

![](/IMG_2819.PNG)

![IMG_2820](/IMG_2820.PNG)

![IMG_2821](/IMG_2821.PNG)

# 难点：

1. 在SwiftUI生命周期，使用AppDelegate

   ```
   class AppDelegate: NSObject {
       override init() {
           super.init()
       }
   }
   
   @main
   struct NetflixApp: App {
       @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
       
       @State var selectIndex = 0
       var body: some Scene {
           WindowGroup {
               Tabbar(selectIndex: $selectIndex)
           }
       }
   }
   ```

   

2.横竖屏锁定，及横竖屏切换

```
/**
 lock the View landscape disappear
 ```
 +-----------------------------+
 |  +---+                      |
 |  |   |                      |
 |  |   |         +----------+ |
 |  |   | +-----> |          | |
 |  |   |         +----------+ |
 |  +---+                      |
 +-----------------------------+
 ```
 chane the appledate `orientationLock` to portrait, and set `UIDevice` for `orientation`
 */
struct LandscapeViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onDisappear(perform: {
                DispatchQueue.main.async {
                    AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                    UINavigationController.attemptRotationToDeviceOrientation()
                }
            })
            .onAppear(perform: {
                AppDelegate.orientationLock = UIInterfaceOrientationMask.landscape
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                UINavigationController.attemptRotationToDeviceOrientation()
            })
    }
}

extension View {
    func lockLandscape() -> some View {
        self.modifier(LandscapeViewModifier())
    }
}

extension AppDelegate {
    // 屏幕旋转锁定
    static var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}

```

3.`ObservedObject`往子视图传递，直接复制

```
struct MoreUserListView: View {
//    Remember, we can share ObservableObject between multiple views,
//    that’s why it must be a reference type/class.
    @ObservedObject var viewModel: MoreStore
}
```

4.图片既要fill，又要等比缩放

![](/IMG_2805.JPG)

```
Color.black
    .aspectRatio(1, contentMode: .fit)
    .overlay(
        WebImage(url: URL(string: user.avatarUrl))
            .resizable()
            .aspectRatio(contentMode: .fill)
    )
    .clipped()
    .cornerRadius(5.0)
    .overlay(
        RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: user.id == viewModel.selectUserID ? 4 : 0)
    )

```

