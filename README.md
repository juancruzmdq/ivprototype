# ivprototype

Mail by InVision prototype.


## Requirements

Prototype viewable here: https://invis.io/3K6DOMMD5

Three views: login, listing, and details. No parts of the prototype are required to function outside these views, but any buttons or inputs are expected to exist and allow interaction.

Login: Not included in the prototype. We would like a sign-in view that the app opens up to. This view should accept an email and password, and accept any form of input to mock the login process.

Listing: The inbox view; this contains the list of emails. This view also contains a button for the drawer, which should function and show the contents of the drawer as designed.

Details: This is the view to read an email thread. Only one of these views needs to be populated for demonstration purposes, and should match the prototype.





## Install

Clone this repo in your machine
```bash
git clone git@github.com:juancruzmdq/ivprototype.git
```

Change directory to "ivprototype"

```bash
cd ivprototype
```

Install pods (Install [cocoapods](https://cocoapods.org/) if need )

```bash
pod install
```

Open workspace

```bash
open ivprototype.xcworkspace 
```

## Backend
For this prototype I used [hook.io](https://hook.io) as a backend service.
This Service has a public endponit to retrieve a list of emails.

### [Inbox endpoint](http://hook.io/juancruzmdq-gmail-com/inbox)

URL: http://hook.io/juancruzmdq-gmail-com/inbox
Params: don't accept parameters
Result: JSON  with an Inbox object that contains a list of emails

Scheme:

```bash
{
    "$schema": "http://json-schema.org/draft-04/schema#",
    "id": "/",
    "type": "object",
    "properties": {
        "inbox": {
            "id": "inbox",
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "uid": {
                        "id": "uid",
                        "type": "string"
                    },
                    "from": {
                        "id": "from",
                        "type": "string"
                    },
                    "to": {
                        "id": "to",
                        "type": "string"
                    },
                    "subject": {
                        "id": "subject",
                        "type": "string"
                    },
                    "text": {
                        "id": "text",
                        "type": "string"
                    },
                    "responseToUid": {
                        "id": "responseToUid",
                        "type": "string"
                    },
                    "dateTime": {
                        "id": "dateTime",
                        "type": "string"
                    }
                }
            }
        }
    }
}
```

Example:

```bash
{
    "inbox": [
    {
        "uid": "1",
        "from": "matt@gmail.com",
        "to": "jhon@gmail.com",
        "subject": "subject 1",
        "text": "1) Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "responseToUid": "",
        "dateTime": "Today"
    }
    ]
}
```


## Project Structure

The project is divided in three main folders. Libraries, ivprototype and ivprototypeTest

### Libraries

This folder contain a set of classes and helpers that can be reusable in other projects. These classes have been created as part of the prototype, so the functionality is very limited and can be improved.

1. **Additions**: Currently this folder contains a NSString extension that add a method to validate if the string represent a valid email address.

example:

```objective-c
    if ([@"tom@gmail.com" isValidEmail]) {
        NSLog(@"Valid Email")
    }
```

2. **Managers**: Contains the *FlowManager* class. This class is responsable of maintain a set of ViewControllers, each viewcontroller is the root view of a posible flow in the app. This class also allow to exchange these flows in the app's window.

```objective-c
    UIViewControler *vc1 = ....; //set with an instance of UIViewController
    UIViewControler *vc2 = ....; //set with an instance of UIViewController
    UIWindow *win = ....; //set with the main app's window

    FlowManager *fm = [[FlowManager alloc] init];
    [fm setWindow:win];
    [fm setFlow:@"one" withViewController:vc1];
    [fm setFlow:@"two" withViewController:vc2];

    [fm swithFlowToController:@"one"];

    // In other place of the app, swith to other flow
    [fm swithFlowToController:@"two"];
    
```


3. **Network**: A couple of classes that work as proxy of a remote service. 
  - *RemoteService*: Map a remote HTTP service, is responsable of mantain and call a set of RemoteResources.
  - *RemotResources*: represent an HTTP EndPoint for a remote service. Map the URL relative to the service root, mantain a set of parameters, and parse the server response, usually to map the response to the app model.

```objective-c

    RemoteService *serv = [[RemoteService alloc] initWithBaseURL:@"http://jsonplaceholder.typicode.com"];

    RemoteResource * posts = [[RemoteResource alloc] init];
    [posts setPath:@"/posts"];
    // Set params if need
    // [posts setParams:@{@"key":@"value"}]; 
    [posts setParse:^ id (id response) {
        // Do something with the response
        return response;
    }];

    [serv addResource:posts forKey:@"posts"];

    [serv getResource:@"posts"
        onSuccess:^(id _Nonnull result) {
            NSLog(@"Posts: %@", result);
        } onFailure:^(NSError * _Nonnull error) {
            NSLog(@"Posts Error: %@", error);
    }];

```

4. **UI**: General classes related to the UI of an app.
  - *DrawerViewController*: Is a ViewController that contains two subviews controllers, one of these controllers will be shown centered, and another the other one will be shown as background. The central view slides to right/left to the make visible the view in the back.
```objective-c

    DrawerViewController *dw = [DrawerViewController drawerWithCenterViewController:self.inboxViewController
leftMenuViewController:self.menuViewController];
    dw.slideDistance = 255; // Set slide distance if need

    // Show left menu
    [dw toggleDrawer];

    // When the left view is visible, hide Left Menu
    [dw toggleDrawer];
    
```

  - *ReallySimpleProgress*: Simple view controller with a title and a spinner, used to indicate that there are some process runing in background.
```objective-c

    ReallySimpleProgress *loading = [ReallySimpleProgress progressWithTitle:@"Doing something"];
    [self presentViewController:loading animated:NO completion:nil];

    // Retrieve Emails. from remote service, and display conversations
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

        [loading dismissViewControllerAnimated:YES completion:nil];

    });

```

### ivprototype

This folder cointains the classes of the prototype

1. **API**: EmailService is a RemoteService extension to comunicate with the Email backend. Create a RemoteResource to get info from the endpoint "inbox", and parse the JSON response to the app model.

2. **Managers**: EmailFlowManager is an extension of FlowManager. This class contains to flows:
  - *EmailFlowManagerLogin*: This is the initial flow of the app, the app will present *LoginViewController* when needed validate the user identity. in the case of this prototype
  - *EmailFlowManagerMain*:This is the mail flow of the app. Present the *InboxViewController* view in a navigation bar, with *MenuViewController* as left menu in the back.

3. **Model**:
  - *Inbox*: Entity with a list of Emails. This list can be grouped in conversations, to group it use the responseToUid to identify which emails are linked. 
  - *Email*: Entity to represesnt an Email in the app. For this prototype only have the email properties.

4. **Storyboards**:
  - *LaunchScreen*: Include the ViewController used as Splash for the app launch. 
  - *Login*: Include LoginViewController's view 
  - *Main*: Include the views for the Inbox master-detail, and the View for the lateral menu.

5. **Views**: Folder with sets of views controllers used in the app


### ivprototypeTest

Test cases for the prototype, include only two simple test, one for the email validator, and another one for the inbox resoruce creation








