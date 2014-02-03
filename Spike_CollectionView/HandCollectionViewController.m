//
//  DemoCollectionViewController.m
//  Spike_CollectionView
//
//  Created by Greg Tarsa on 1/31/14.
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import "HandCollectionViewController.h"
#import "FishDisplayCard.h"
#import "GoFishModel.h"
#import "SmileyFaceViewController.h"
#import "SmileyFaceView.h"


@interface HandCollectionViewController ()

@property (nonatomic, strong) GoFishModel *game;
@property (nonatomic, strong) NSMutableArray *displayCards;

@end

@implementation HandCollectionViewController

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
    [self loadHandIntoDisplay];

    // size the flow layout item size from a "typical" card image size
    UICollectionViewFlowLayout *handViewLayout = [UICollectionViewFlowLayout new];
    UIImage *refCard = [UIImage imageNamed:@"qs"];
    handViewLayout.itemSize = refCard.size;

    // Create a Collection view with a default layout and flow.
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:handViewLayout];
   // collectionView.contentMode = UIViewContentModeScaleAspectFit;
    
    collectionView.dataSource = self;
    [collectionView registerClass:[FishDisplayCard class] forCellWithReuseIdentifier:@"tbd"];
    
    self.view = collectionView;
    self.view.backgroundColor = [UIColor purpleColor];
    
//    SmileyFaceView *smiley = [SmileyFaceView new];
//    [self.view addSubview:smiley];
//    [self.view addConstraints:[NSLayoutConstraint
}

- (void)loadHandIntoDisplay {
    self.displayCards = [NSMutableArray new];
    self.game = [GoFishModel new];
    self.game.pond = [FishDeck newWithCards];
    [self.game.pond shuffle];
    self.game.hand = [FishHand new];


    // create a hand
    for (NSInteger i = 0; i < 7; i++) {
        FishCard *card = [self.game.pond give_card];
        [self.game.hand receiveCard:card];
        
        FishDisplayCard *displayCard = [FishDisplayCard new];
        displayCard.card = card;
        [self.displayCards addObject:displayCard];
    }
}


- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.displayCards count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FishDisplayCard *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tbd" forIndexPath:indexPath];
    
    FishDisplayCard *thisCard = [self.displayCards objectAtIndex:indexPath.row];


    cell.cardImageView.image = [UIImage imageNamed:[thisCard.card FancyFileBaseName]];
    cell.card = thisCard.card;
//    cell.cardImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGSize imageSize = cell.cardImageView.image.size;
    cell.cardImageView.frame = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);

    cell.backgroundColor = [UIColor greenColor];

   
   
    //    cell.contentView.transform =co
//    UICollectionViewLayoutAttributes *layout = [UICollectionViewLayoutAttributes]
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
