import UIKit

final class CustomLayoutManager: NSLayoutManager {
    
    private var callCounter = 1
    
    override func drawBackground(forGlyphRange glyphsToShow: NSRange, at origin: CGPoint) {
        super.drawBackground(forGlyphRange: glyphsToShow, at: origin)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        print("------------------------------")
        print("drawBackground #\(callCounter)")
        print("glyphsToShow: \(glyphsToShow)")
        
        context.saveGState()
        context.setStrokeColor(UIColor.orange.cgColor)
        context.setFillColor(UIColor.red.cgColor)
        
        enumerateLineFragments(forGlyphRange: glyphsToShow) { rect, _, _, _, _ in
            context.stroke(rect.offsetBy(dx: origin.x, dy: origin.y))
        }
        
        let realExtraLineRect = extraLineFragmentRect.offsetBy(dx: origin.x, dy: origin.y)
        
        context.fill(realExtraLineRect)
        context.restoreGState()
        
        print("realExtraLineRect: \(realExtraLineRect)")
        
        callCounter += 1
    }
}
