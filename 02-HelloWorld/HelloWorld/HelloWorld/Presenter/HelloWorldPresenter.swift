import Foundation

class HelloWorldPresenter {
    private let model = HelloWorldModel()
    
    var textToDisplay: String {
        return model.text
    }
}
