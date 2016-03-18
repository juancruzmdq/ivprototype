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

Example:

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
}]
}


## Project 