//
//  UIViewExtention.swift
//  JTProject
//
//  Created by comv on 2016/12/30.
//  Copyright © 2016年 comv. All rights reserved.
//

import UIKit

extension UIView {
    var viewMinX: CGFloat {
        return self.frame.origin.x
    }
    
    var viewMidX: CGFloat {
        return self.frame.size.width/2 + self.viewMinX
    }
    
    var viewMaxX: CGFloat {
        return (self.frame.size.width + self.viewMinX)
    }
    
    var viewMinY: CGFloat {
        return self.frame.origin.y
    }
    
    var viewMidY: CGFloat {
        return self.frame.size.height/2 + self.viewMinY
    }
    
    var viewMaxY: CGFloat {
        return self.frame.size.height + self.viewMinY
    }
    
    var viewWidth: CGFloat {
        return self.bounds.size.width
    }
    
    var viewHeight: CGFloat {
        return self.bounds.size.height
    }
    
}
