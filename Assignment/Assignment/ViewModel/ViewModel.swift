import Foundation

class ContentViewModel: ObservableObject {
    @Published var images = ["fried-cheese-ravioli", "Blackend-Shrimp", "morazella-sticks","chicken-avacado-spring-roll"]
    @Published var searchText = ""
    @Published var selectedIndex = 0

    var allItems: [Item] = [
        Item(name: "Blackened Shrimp"),
        Item(name: "Buffalo Chicken Bites"),
        Item(name: "Chicken Avocado Spring Roll"),
        Item(name: "Chicken Dumplings"),
        Item(name: "Chicken Wings"),
        Item(name: "Meatballs"),
        Item(name: "Fried Cheese Ravioli"),
        Item(name: "Jumbo Tater Tots"),
        Item(name: "Mozzarella Sticks"),
        Item(name: "Philly Cheesesteak Sliders"),
        Item(name: "Rainbow Spring Rolls"),
        Item(name: "Stuffed Shells"),
        Item(name: "Asian Flank Steak")
    ]

    var filteredItems: [Item] {
        if searchText.isEmpty {
            return allItems
        } else {
            return allItems.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
