//
//  FetchOnDemandPageViewController.m
//  Taboola JS ObjC Sample
//
//  Created by Roman Slyepko on 1/23/19.
//  Copyright © 2019 Taboola LTD. All rights reserved.
//

#import "FetchOnDemandPageViewController.h"
#import "PageContentViewController.h"

@interface FetchOnDemandPageViewController () <UIPageViewControllerDataSource>

@end

@implementation FetchOnDemandPageViewController {
    NSUInteger pageQnty;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    pageQnty = 5;
    self.dataSource = self;
    [self setViewControllers:@[[self viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    // Do any additional setup after loading the view.
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (index < 0 || index >= pageQnty)
        return nil;
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.pageIndex = index;
    
    return pageContentViewController;
}

#pragma mark - Navigation

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    return [self viewControllerAtIndex:++index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    return [self viewControllerAtIndex:--index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return pageQnty;
}

@end
