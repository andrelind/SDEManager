#import <UIKit/UIKit.h>

@class SDEItem;

@protocol SDEItemListViewControllerDelegate;

@interface SDEItemListViewController : UITableViewController <UISearchDisplayDelegate>

@property (nonatomic, assign) SDEItemType itemType;
@property (nonatomic, retain) id<SDEItemListViewControllerDelegate> itemControllerDelegate;

@end

@protocol SDEItemListViewControllerDelegate <NSObject>
- (void)itemListController:(SDEItemListViewController *)controller didSelectItem:(SDEItem *)item;
@end