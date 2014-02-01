//
//  DemoCollectionViewController.m
//  Spike_CollectionView
//
//  Created by Greg Tarsa on 1/31/14.
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import "DemoCollectionViewController.h"
#import "FishDisplayCard.h"

@interface DemoCollectionViewController ()
@end

@implementation DemoCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Create a Collection view with a default layout and flow.
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:[UICollectionViewFlowLayout new]];

    collectionView.dataSource = self;
    [collectionView registerClass:[FishDisplayCard class] forCellWithReuseIdentifier:@"tbd"];
    self.view = collectionView;
    self.view.backgroundColor = [UIColor purpleColor];
    
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FishDisplayCard *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tbd" forIndexPath:indexPath];

    cell.cardImage.image = [UIImage imageNamed:@"qs"];
    cell.backgroundColor = [UIColor greenColor];
//    cell.contentView.transform =
//    UICollectionViewLayoutAttributes *layout = [UICollectionViewLayoutAttributes]
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
