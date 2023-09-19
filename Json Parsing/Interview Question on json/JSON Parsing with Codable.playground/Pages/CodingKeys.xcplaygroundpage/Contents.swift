/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## CodingKeys
If your classes or structures use differnt property names than what the feed contains, you are going to have to map the keys to the class or struct property names.
*/

// INTERVIEW QUESTION
// convert cAMEL case to snake case
// THIS IS FOR SNAKECASE EXAMLE
//import UIKit
//struct ColorPalette: Decodable {
//    struct PaletteColor: Decodable {
//        let sortOrder: Int
//        let description: String
//        let red: Int
//        let green: Int
//        let blue: Int
//        let alpha: Double
//    }
//    let paletteName: String
//    let paletteInfo: String
//    let paletteColors: [PaletteColor]
//}

import UIKit
struct ColorPalette: Codable
{
    let paletteName, paletteInfo: String
    let paletteColors: [PaletteColor]

    enum CodingKeys: String, CodingKey
    {
        case paletteName = "palette_name"
        case paletteInfo = "palette_info"
        case paletteColors = "palette_colors"
    }
}
struct PaletteColor: Codable {
    let sortOrder: Int
    let description: String
    let red, green, blue, alpha: Int

    enum CodingKeys: String, CodingKey {
        case sortOrder = "sort_order"
        case description, red, green, blue, alpha
    }
}

guard let sourcesURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else {
    fatalError("Could not find FlatColors.json")
}
guard let colorData = try? Data(contentsOf: sourcesURL) else {
    fatalError("Could not conver data")
}

let decoder = JSONDecoder()
//THIS FOR FIRST EXAMPLE
//decoder.keyDecodingStrategy = .convertFromSnakeCase

guard let flatColors = try? decoder.decode(ColorPalette.self, from: colorData) else {
    fatalError("There was a problem decoding the data....")
}
print(flatColors.paletteName)
for color in flatColors.paletteColors{
    print(color.description)
}
/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
