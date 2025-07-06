import Foundation

class ClickCounterPresenter {
    private var model = ClickCounterModel()
    var countText: String {
        return "回数: \(model.count)"
    }
    
    func increment() {
        model.count += 1
    }
}
