
#import <UIKit/UIKit.h>

/// Provides extensions for `UIControl`.
@interface UIControl (Block)

/// Removes all targets and actions for a particular event (or events) from an internal dispatch table.
- (void)removeAllTargets;

/// Adds or replaces a target and action for a particular event (or events) to an internal dispatch table.
- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

/// Adds a block for a particular event (or events) to an internal dispatch table.
- (void)addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

/// Adds or replaces a block for a particular event (or events) to an internal
- (void)setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

///Removes all blocks for a particular event (or events) from an internal
- (void)removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
