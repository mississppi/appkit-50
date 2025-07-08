import Cocoa

class CatalogPresenter {
    unowned let viewController: CatalogViewController
    
    init(viewController: CatalogViewController) {
        self.viewController = viewController
    }
    
    func didSelectComponent(name: String) {
        let sampleView: NSView
        
        switch name {
        case "Button":
            sampleView = ButtonSampleView(frame: .zero)
            
        case "Label":
            sampleView = LabelSampleView(frame: .zero)
            
        case "TextField":
            sampleView = TextFieldSampleView(frame: .zero)
            
        case "ImageView":
            sampleView = ImageViewSampleView(frame: .zero)
            
        case "Slider":
            sampleView = SliderSampleView(frame: .zero)
            
        default:
            sampleView = NSView()
        }
        
        viewController.displayComponentView(sampleView)
    }
}
