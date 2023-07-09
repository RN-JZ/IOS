/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Getting JSON from Local File
You may wish to seed your structs or classes from JSON files that you have stored in the Application Bundle.  Or, you may have stored some JSN in the applications Documents folder and want to restore from that JSON.  This section will show you how to retrive and decode JSON from a file.
*/
import UIKit

struct ColorPalette: Codable {
    let paletteName, paletteInfo: String
    let paletteColors: [PaletteColor]

    enum CodingKeys: String, CodingKey {
        case paletteName = "palette_name"
        case paletteInfo = "palette_info"
        case paletteColors = "palette_colors"
    }
}

// MARK: - PaletteColor
struct PaletteColor: Codable {
    let sortOrder: Int
    let description: String
    let red, green, blue, alpha: Int

    enum CodingKeys: String, CodingKey {
        case sortOrder = "sort_order"
        case description, red, green, blue, alpha
    }
}



// TO GET DATA FROM LOCAL FILE WE UUSE BUNDLE.main
guard let sourceURL = Bundle.main.url(forResource: "FlatColors", withExtension: ".json") else {
    fatalError("COULD NOT FIND FILE")
}
 // SECOND IS TO FORM DATA OBJECT BUT WE DONOT
guard let  ColorData = try? Data(contentsOf: sourceURL) else {
    fatalError("COULD NOT convert to data")
}

let decoder = JSONDecoder()
guard let  flatData = try? decoder.decode(ColorPalette.self, from: ColorData) else {
    fatalError("There is problem decoding data ----")
}
print(flatData.paletteName)
/*:
 ### Build the Decodable Model based on the Prettyfied FlatColors.json
 */

/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
