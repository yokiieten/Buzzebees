
import UIKit

extension UICollectionView {
    func registerCells(classNames: [String]) {
        for className in classNames {
            register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
        }
    }
}
