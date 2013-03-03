//
//  ViewController.m
//  CPGrapher
//
//  Created by Greg Paton on 3/2/13.
//  Copyright (c) 2013 Greg Paton. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect frame = [[self view] bounds];
    //frame.size.height = 200; // not too tall
    CPTGraphHostingView *chartView = [[CPTGraphHostingView alloc] initWithFrame: frame];
    [[self view] addSubview:chartView];
    
    CPTTheme *theme = [CPTTheme themeNamed:kCPTPlainWhiteTheme];
    graph = [theme newGraph];
    chartView.hostedGraph = graph;
    
    graph.paddingLeft = 20.0;
    graph.paddingTop = 20.0;
    graph.paddingRight = 20.0;
    graph.paddingBottom = 20.0;
    
    plotSpace = (CPTXYPlotSpace *)graph.defaultPlotSpace;
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat(100)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat(100)];
    
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)graph.axisSet;
    
    CPTXYAxis *x = axisSet.xAxis;
    x.majorIntervalLength = CPTDecimalFromFloat(10);
    x.minorTicksPerInterval = 2;
    x.borderWidth = 0;
    x.labelExclusionRanges = [NSArray arrayWithObjects:
                              [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(-100)
                                                          length:CPTDecimalFromFloat(300)], nil];
    
    CPTXYAxis *y = axisSet.yAxis;
    y.majorIntervalLength = CPTDecimalFromFloat(10);
    y.minorTicksPerInterval = 1;
    y.labelExclusionRanges = [NSArray arrayWithObjects:
                              [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(-100)
                                                          length:CPTDecimalFromFloat(300)], nil];
    
    CPTScatterPlot *sp = [[CPTScatterPlot alloc] init];
    sp.identifier = @"PLOT";
    sp.dataSource = self;
    sp.delegate = self;
    [graph addPlot:sp toPlotSpace:graph.defaultPlotSpace];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return 100;
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum
               recordIndex:(NSUInteger)index { 
    double val = index;
    return [NSNumber numberWithDouble:val];
}

@end
