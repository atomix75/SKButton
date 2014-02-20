//
//  SKButton.h
//


#import <SpriteKit/SpriteKit.h>

@interface SKButton : SKNode

@property (nonatomic, strong) SKSpriteNode *activeSprite;
@property (nonatomic, strong) SKSpriteNode *normalSprite;
@property (nonatomic, strong) SKLabelNode *labelNode;
@property (nonatomic, readwrite) BOOL buttonPressed;
@property (nonatomic, readwrite) BOOL buttonActive;

+ (instancetype)buttonWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage withTarget:(id)target action:(SEL)action;

+ (instancetype)buttonWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage withTarget:(id)target action:(SEL)action withObject:(id)object;

+ (instancetype)buttonWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage;

+ (instancetype)buttonWithTextLabel:(NSString *)label withTarget:(id)target action:(SEL)action;

@end
