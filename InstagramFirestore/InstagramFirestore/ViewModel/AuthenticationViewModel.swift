import Foundation
import UIKit

protocol AuthnticationViewModel
{
    var isValid:Bool {get}
}

struct loginViewModel:AuthnticationViewModel
{
    var email:String?
    var password:String?
    
    var isValid:Bool
    {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
}

struct Authentication:AuthnticationViewModel
{
    var email:String?
    var password:String?
    var userName:String?
    var FullName:String?
    var isValid:Bool
    {
        return email?.isEmpty == false && password?.isEmpty == false && userName?.isEmpty == false && FullName?.isEmpty == false
    }
    
    
}



