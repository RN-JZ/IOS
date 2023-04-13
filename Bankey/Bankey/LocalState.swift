

import Foundation
public class LocalState
{
    private enum Keys:String
    {
        case hasOnboarded
        case alreadyLogin
    }
    public static var hasOnboarded:Bool
    {
        get{
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue)
        {
            print("foo-\(Keys.hasOnboarded.rawValue)")
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
        }
    }
    
    public static var hasLogin:Bool
    {
        get{
            return UserDefaults.standard.bool(forKey: Keys.alreadyLogin.rawValue)
        }
        set(newValue)
        {
            print("foo-\(Keys.alreadyLogin.rawValue)")
            UserDefaults.standard.set(newValue, forKey: Keys.alreadyLogin.rawValue)
        }
    }
    
}
