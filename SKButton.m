//
//  SKButton.m
//


#import "SKButton.h"

@implementation SKButton
{
    id currentTarget, objectToSend;
    SEL currentAction;
}

+ (instancetype)buttonWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage withTarget:(id)target action:(SEL)action withObject:(id)object
{
    return [[SKButton alloc] initWithActiveImage:image normalImage:normalImage with:target action:action withObject:object];
}

+ (instancetype)buttonWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage withTarget:(id)target action:(SEL)action
{
    return [[SKButton alloc] initWithActiveImage:image normalImage:normalImage with:target action:action];
}

+ (instancetype)buttonWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage
{
    return [[SKButton alloc] initWithActiveImage:image normalImage:normalImage];
}

+ (instancetype)buttonWithTextLabel:(NSString *)label withTarget:(id)target action:(SEL)action
{
    return [[SKButton alloc] initWithtextLabel:label withTarget:target action:action];
}

- (id)initWithtextLabel:(NSString *)label withTarget:(id)target action:(SEL)action
{
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        self.buttonPressed = NO;
        
        _labelNode = [SKLabelNode labelNodeWithFontNamed:@"Futura-CondensedExtraBold"];
        _labelNode.text = label;
        _labelNode.fontSize = 40;
        _labelNode.fontColor = [SKColor whiteColor];
        _labelNode.zPosition = .9;
        
        [self addChild:_labelNode];
        
        
        currentAction = action;
        currentTarget = target;
    }
    
    return self;
}

- (id)initWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage with:(id)target action:(SEL)action withObject:(id)object
{
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        self.buttonPressed = NO;
        self.activeSprite = [SKSpriteNode spriteNodeWithImageNamed:image];
        self.normalSprite = [SKSpriteNode spriteNodeWithImageNamed:normalImage];
        
        [self addChild:self.activeSprite];
        [self addChild:self.normalSprite];
        
        self.activeSprite.hidden = YES;
        self.normalSprite.hidden = NO;
        
        currentAction = action;
        currentTarget = target;
        objectToSend = object;
    }
    
    return self;
}

- (id)initWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage with:(id)target action:(SEL)action
{
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        self.buttonPressed = NO;
        self.activeSprite = [SKSpriteNode spriteNodeWithImageNamed:image];
        self.normalSprite = [SKSpriteNode spriteNodeWithImageNamed:normalImage];
        
        [self addChild:self.activeSprite];
        [self addChild:self.normalSprite];
        
        self.activeSprite.hidden = YES;
        self.normalSprite.hidden = NO;
        
        currentAction = action;
        currentTarget = target;
    }
    
    return self;
}

- (id)initWithActiveImage:(NSString *)image normalImage:(NSString *)normalImage
{
    if (self = [super init]) {
        
        self.userInteractionEnabled = YES;
        self.buttonPressed = NO;
        self.activeSprite = [SKSpriteNode spriteNodeWithImageNamed:image];
        self.normalSprite = [SKSpriteNode spriteNodeWithImageNamed:normalImage];
        
        [self addChild:self.activeSprite];
        [self addChild:self.normalSprite];
        
        self.activeSprite.hidden = YES;
        self.normalSprite.hidden = NO;
        
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _buttonActive = !_buttonActive;
    
    if (_labelNode) {
        _labelNode.fontColor = [SKColor redColor];
    }
    
    
    self.activeSprite.hidden = NO;
    self.normalSprite.hidden = YES;
    self.buttonPressed = YES;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.activeSprite.hidden = YES;
    self.normalSprite.hidden = NO;
    if (currentAction) {
        [currentTarget performSelector:currentAction withObject:objectToSend];
    }
    self.buttonPressed = NO;
    
    if (_labelNode) {
        _labelNode.fontColor = [SKColor whiteColor];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.activeSprite.hidden = YES;
    self.normalSprite.hidden = NO;
    self.buttonPressed = NO;
    
    if (_labelNode) {
        _labelNode.fontColor = [SKColor whiteColor];
    }
}

@end
