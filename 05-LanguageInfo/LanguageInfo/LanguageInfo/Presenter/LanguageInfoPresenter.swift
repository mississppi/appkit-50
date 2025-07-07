import Foundation

class LanguageInfoPresenter {
    private let model = LanguageInfoModel()
    
    var availableLanguages: [String] {
        return model.languages
    }
    
    func getFeature(for language: String) -> String {
        return model.features[language] ?? "情報がありません"
    }
}
