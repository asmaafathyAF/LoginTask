

import UIKit

enum StoryboardType:String {
    case Home = "Home"
    case Auth = "Login"
}

class ViewControllersProvider: NSObject {
    public class func viewController(className:String,storyboard:StoryboardType) -> UIViewController
    {
        let target = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return target.instantiateViewController(withIdentifier: className)
    }
}
