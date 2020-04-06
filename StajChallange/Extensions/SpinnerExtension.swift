import UIKit

fileprivate var activityView : UIView?

/*I created this extension to show spinner and close the spinner.*/
extension UIViewController {
    
    func showSpinner() {
        activityView = UIView(frame: self.view.bounds)
        activityView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityView!.center
        activityIndicator.startAnimating()
        activityView?.addSubview(activityIndicator)
        self.view.addSubview(activityView!)
    }
    
    func closeSpinner() {
        activityView?.removeFromSuperview()
        activityView = nil
    }
}
