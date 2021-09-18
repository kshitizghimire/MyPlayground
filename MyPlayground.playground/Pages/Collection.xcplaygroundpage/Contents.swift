import Foundation

enum Category: Hashable {
    case dairy
    case vegetables

}
struct Product {
    var name: String
    var category: Category
}

struct ProductCollection {
    typealias DictionaryType = [Category: [Product]]

    // Underlying, private storage, that is the same type of dictionary
    // that we previously was using at the call site
    private var products = DictionaryType()

    // Enable our collection to be initialized with a dictionary
    init(
        products: DictionaryType
    ) {
        self.products = products
    }
}

extension ProductCollection: Collection {
    // Required nested types, that tell Swift what our collection contains
    typealias Index = DictionaryType.Index
    typealias Element = DictionaryType.Element

    // The upper and lower bounds of the collection, used in iterations
    var startIndex: Index { return products.startIndex }
    var endIndex: Index { return products.endIndex }

    // Required subscript, based on a dictionary index
    subscript(index: Index) -> Iterator.Element {
        get { return products[index] }
    }

    // Method that returns the next index when iterating
    func index(after i: Index) -> Index {
        return products.index(after: i)
    }
}

let products: [Category: [Product]] = [
    .dairy: [
        Product(name: "Milk", category: .dairy),
        Product(name: "Butter", category: .dairy),
    ],
    .vegetables: [
        Product(name: "Cucumber", category: .vegetables),
        Product(name: "Lettuce", category: .vegetables),
    ],
]

let productCollection = ProductCollection(products: products)

for (category, products) in productCollection {
    print(category)
    print(products)
}
