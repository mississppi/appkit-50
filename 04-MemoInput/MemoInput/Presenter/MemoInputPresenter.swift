import Foundation

class MemoInputPresenter {
    private var model = MemoInputModel()
    
    var memos: [String] {
        return model.memos
    }
    
    func addMemo(text: String) {
        model.memos.append(text)
    }
}
