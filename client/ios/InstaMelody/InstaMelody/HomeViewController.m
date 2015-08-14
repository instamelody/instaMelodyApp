//
//  HomeViewController.m
//  
//
//  Created by Ahmed Bakir on 8/7/15.
//
//

#import "HomeViewController.h"
#import "constants.h"
#import "AFHTTPRequestOperationManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profileView.layer.cornerRadius = self.profileView.frame.size.height / 2;
    self.profileView.layer.masksToBounds = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *authToken = [defaults objectForKey:@"authToken"];
    //NSString *deviceToken = [defaults objectForKey:@"deviceToken"];
    
    if ( authToken ==  nil || [authToken isEqualToString:@""]) {
        
        [self signIn:nil];

    } else {
        //validate token
        
        
    }
    
    //to make nav bar clear
    /*
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    */
    
    [self createMenu];
}

-(void)viewDidAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     if ([defaults objectForKey:@"authToken"] !=  nil) {
         self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", [defaults objectForKey:@"FirstName"], [defaults objectForKey:@"LastName"]];
     }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)showSettings:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
}

-(IBAction)signOut:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"authToken"]== nil || [[defaults objectForKey:@"authToken"] isEqualToString:@""]) {
        [self signIn:nil];
    } else {
        
        [defaults setObject:@"" forKey:@"authToken"];
        [defaults synchronize];
    }
}

-(IBAction)signIn:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *nc = [sb instantiateViewControllerWithIdentifier:@"SignInNavController"];
    [self presentViewController:nc animated:NO completion:nil];
}

-(IBAction)changeProfilePic:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:^{
        NSLog(@"Image picker presented!");
    }];
}

-(void)createMenu {
    UIImage *micImage = [UIImage imageNamed:@"mic"];
    
    UIImage *soloImage = [UIImage imageNamed:@"solo"];
    UIImage *chatImage = [UIImage imageNamed:@"chat"];
    UIImage *loopImage = [UIImage imageNamed:@"loop"];
    
    micImage = [HomeViewController imageWithImage:micImage scaledToSize:CGSizeMake(75, 75)];
    soloImage = [HomeViewController imageWithImage:soloImage scaledToSize:CGSizeMake(50, 50)];
    chatImage = [HomeViewController imageWithImage:chatImage scaledToSize:CGSizeMake(50, 50)];
    loopImage = [HomeViewController imageWithImage:loopImage scaledToSize:CGSizeMake(50, 50)];
    
    // Default Menu
    
    AwesomeMenuItem *starMenuItem1 = [[AwesomeMenuItem alloc] initWithImage:soloImage
                                                           highlightedImage:soloImage
                                                               ContentImage:nil
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem2 = [[AwesomeMenuItem alloc] initWithImage:chatImage
                                                           highlightedImage:chatImage
                                                               ContentImage:nil
                                                    highlightedContentImage:nil];
    AwesomeMenuItem *starMenuItem3 = [[AwesomeMenuItem alloc] initWithImage:loopImage
                                                           highlightedImage:loopImage
                                                               ContentImage:nil
                                                    highlightedContentImage:nil];
    
    NSArray *menuItems = [NSArray arrayWithObjects:starMenuItem1, starMenuItem2, starMenuItem3, nil];
    
    AwesomeMenuItem *startItem = [[AwesomeMenuItem alloc] initWithImage:micImage
                                                       highlightedImage:micImage
                                                           ContentImage:micImage
                                                highlightedContentImage:micImage];
    
    AwesomeMenu *menu = [[AwesomeMenu alloc] initWithFrame:self.view.bounds startItem:startItem menuItems:menuItems];
    menu.delegate = self;
    menu.startPoint = CGPointMake(self.view.frame.size.width - 60, self.view.frame.size.height - 60);
    menu.menuWholeAngle = -1 * M_PI / 2;
    
    [self.view addSubview:menu];

}

- (void)awesomeMenu:(AwesomeMenu *)menu didSelectIndex:(NSInteger)idx
{
    NSLog(@"Select the index : %d",idx);
}
- (void)awesomeMenuDidFinishAnimationClose:(AwesomeMenu *)menu {
    NSLog(@"Menu was closed!");
}
- (void)awesomeMenuDidFinishAnimationOpen:(AwesomeMenu *)menu {
    NSLog(@"Menu is open!");
}

#pragma mark - image picker delegate


-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *selectedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.profileImageView setImage:selectedImage];
    [picker dismissViewControllerAnimated:YES completion:^{
         NSLog(@"Image selected!");
     }];
    
    [self updateProfilePicture:selectedImage];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Picker cancelled without doing anything");
    }];
}


#pragma mark - network operations
-(void)updateProfilePicture:(UIImage *)image{
    
    //step 1 - get file token
    

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *token =  [defaults objectForKey:@"authToken"];
    
    NSString *imageName = [NSString stringWithFormat:@"%@_%@_profile.png", [defaults objectForKey:@"FirstName"], [defaults objectForKey:@"LastName"]];
                         
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"Token": token, @"Image": @{@"FileName" : imageName}}];
    
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@/User/Update/Image", BASE_URL];
    
    //add 64 char string
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:requestUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);

        //
        //step 2 - upload file
        
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSDictionary *tokenDict = [responseDict objectForKey:@"FileUploadToken"];
        NSString *fileTokenString = [tokenDict objectForKey:@"Token"];
        
        NSData *imageData = UIImagePNGRepresentation(image);
        
        [self uploadData:imageData withFileToken:fileTokenString];
         
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:error.description delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }];
    
    
}

-(void)uploadData:(NSData *)data withFileToken:(NSString *)fileToken {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *sessionToken =  [defaults objectForKey:@"authToken"];
    
    NSString *requestUrl = [NSString stringWithFormat:@"%@/Upload/%@/%@", BASE_URL, sessionToken, fileToken];
    
    //add 64 char string
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:requestUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFormData:data name:@"file"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have updated your profile photo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:error.description delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }];
    
}

@end
