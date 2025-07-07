import Foundation

class LanguageInfoModel {
    let languages: [String] = [
        "Swift",
        "Python",
        "C",
        "Javascript",
        "Rust"
    ]
    
    let features: [String: String] = [
        "Swift": "Apple製。安全で高速。UI開発にも強い。",
        "Python": "インデントが重要。学習しやすくAIでも人気。",
        "C": "低レベルで高速。ポインタ操作が可能。",
        "JavaScript": "Webで動く唯一の言語。動的型付き。",
        "Rust": "安全性と速度を両立。所有権システムが特徴。"
    ]
}
