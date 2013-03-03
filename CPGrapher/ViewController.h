//
//  ViewController.h
//  CPGrapher
//
//  Created by Greg Paton on 3/2/13.
//  Copyright (c) 2013 Greg Paton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface ViewController : UIViewController <CPTBarPlotDataSource, CPTBarPlotDelegate> {
    
    CPTXYGraph *graph;
    CPTXYPlotSpace *plotSpace;
}

@end
