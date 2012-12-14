//
//  DPBaseTestCase.m
//
//  Created by Michael Kamphausen on 14.09.12.
//  Copyright (c) 2012 Michael Kamphausen. All rights reserved.
//

#import "DPBaseTestCase.h"
#import "DSAppDelegate.h"

NSString* const DSStoryboardName = @"storyboard-iphone";
NSString* const DSModelName = @"datamodel";

@implementation DPBaseTestCase

static DSMockDataGenerator* mockDataGenerator;

- (DSMockDataGenerator*)mockDataGenerator {
    if (!mockDataGenerator) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:DSModelName withExtension:@"momd"];
        NSManagedObjectModel* model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        NSPersistentStoreCoordinator* coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        NSManagedObjectContext* managedObjectContext = [[NSManagedObjectContext alloc] init];
        managedObjectContext.persistentStoreCoordinator = coordinator;
        mockDataGenerator = [[DSMockDataGenerator alloc] initWithManagedObjectContext:managedObjectContext];
    }
    return mockDataGenerator;
}

- (UIViewController*)setUpViewControllerWithIdentifier:(NSString*)identifier {
    UIStoryboard *dingsStoryboard = [UIStoryboard storyboardWithName:DSStoryboardName bundle:nil];
    assertThat(dingsStoryboard, notNilValue());
    UINavigationController* navigationVC = [dingsStoryboard instantiateInitialViewController];
    assertThat(navigationVC, notNilValue());
    DSAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    assertThat(appDelegate, notNilValue());
    appDelegate.window.rootViewController = navigationVC;
    UIViewController* viewController = [dingsStoryboard instantiateViewControllerWithIdentifier:identifier];
    assertThat(viewController, notNilValue());
    [navigationVC pushViewController:viewController animated:NO];
    // causes the viewController to call its loadView method
    view = viewController.view;
    // wait for viewDidAppear to finish, otherwise presenting other view controllers during tests might cause "Unbalanced calls to begin/end appearance transitions" error
    [self wait:0.01];
    return viewController;
}

- (void)tearDownViewController {
    [self wait:0.01];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:DSStoryboardName bundle:nil];
    UINavigationController* navigationVC = [storyboard instantiateInitialViewController];
    [navigationVC popToRootViewControllerAnimated:NO];
    view = nil;
}

@end
