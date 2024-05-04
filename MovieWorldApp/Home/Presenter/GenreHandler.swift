
class GenreHandler {
    static let shared = GenreHandler()
    
    private var items = [GenreEntitiy]()
    
    func setItems(items: [GenreEntitiy]) {
        self.items = items
    }
    
    func getItemTitles(ids: [Int]) -> [String] {
        var titles = [String]()
        let elements = items.filter({ ids.contains($0.id ?? 0) })
        for element in elements {
            titles.append(element.name ?? "")
        }
        return titles
    }
}

