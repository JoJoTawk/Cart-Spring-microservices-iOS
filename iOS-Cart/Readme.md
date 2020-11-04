
## Prerequisite 

- Xcode 9.0+

- Swift 4.0+

#   What is VIPER ?

Viper is an architecture that divides a feature implementation into five distinct layer in one module. Each character of VIPER represents a different layer;

```
    V: View
    I: Interactor
    P: Presenter
    E: Entity
    R: Router

```
    Each layer has a distinct role in the module. 
    In VIPER, I think implementing a feature like building a lego from different parts.
    Let’s take a look at each layer,

 **View**

    View is a dummy object receiving touch events most of the time.
    Instead of MVC’s massive view controller with thousands lines of codes, basically all service related codes and decision makings should not exist in it. 
    For example, when a touch event was received from the user, view object should notify the presenter like “My dear presenter, a touch was received from user and I don’t know what I should do with it”
    
**Presenter**

    I think presenter is the heart of the VIPER module. 
    Only layer in the module that communicates with all other layers. 
    Basically all decision makings should be handled in the presenter. 
    After the decision, presenter has to communicate with the layer required. 
    For example, after notified by view with touch event, presenter should decide what should be done next. Does screen need to update it’s UI ? Then tell view layer to update UI with given info.
    Should a data be fetch from remove server ? Then tell interactor to fetch it.
    Similarly, does app need to navigate to other screen ? Then tell router to navigate which screen it is.
    
**Interactor**

    Interactor contains business logic and it’s mostly responsible from api calls. 
    It builds request from parameters and creates objects by mapping response.
    After finishing service connection, it notifies presenter like “Hey presenter, these are puppies you are looking for” or “I’m sorry, I am not able to fetch your needs at this moment”.
    You get the idea.
**Router**
    
    You need segue to another module ? Tell router which module it should be presented next and leave the rest to it. 
    Router needs a UINavigationController instance to do such navigation stuff.
    Also I think that router should be responsible for showing alerts since UIAlertController is used with present method.
    
**Entity**

    Plain data objects mainly driven by interactor. No more, no less.

To summarize, what a VIPER module should look like, take a look at the figure below;


![Alt text](https://github.com/JoJoTawk/Cart-Spring-microservices-iOS/blob/iOS/iOS-Cart/1_rnmJYsedkv4jybUeQxJI4g.png)

# Using URLSession to retrieve JSON in Swift

URLSession is the successor of NSURLConnection. For many years, NSURLConnection has been the workhorse for networking on iOS and macOS. Most developers used or created a wrapper around NSURLConnection to hide the less enjoyable aspects of the API.

In addition to being a class, URLSession is a technology that provides the infrastructure for networking, exposed through a modern and elegant API. In this series, I introduce you to the URLSession stack. You learn how easy it is to get started with URLSession and you discover that URLSession exposes a flexible API that should meet anyone's networking needs.

### Here’s how the environment works:

   - You use `URLSession` to create a session. You can think of a session as an open tab or window in your webbrowser, which groups together many HTTP requests over subsequent website visits.
   - The URLSession is used to create `URLSessionTask` instances, which can fetch and return data to your app, and download and upload files to webservices.
   - You configure a session with a `URLSessionConfiguration` object. This configuration manages caching, cookies, connectivity and credentials.
   - To make a request, you create a data task, of class `URLSessionDataTask`, and you provide it with a URL, such as https://www.google.com, and a completion handler. This is a closure that’s executed when the request’s response is returned to your app.
   - When the completion handler is executed, you can inspect the returned data and take appropriate action, such as loading the data into the App UI.
   
   You use a `URLSession` to make multiple subsequent requests, as `URLSessionTask` instances. A task is always part of a session. The `URLSession` also kinda functions like a factory that you use to set up and execute different `URLSessionTasks`, based on the parameters you put in.


# Extensions

Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions do not have names.)

Extensions in Swift can:

  - Add computed instance properties and computed type properties
  - Define instance methods and type methods
  -  Provide new initializers
  - Define subscripts
  - Define and use new nested types
  - Make an existing type conform to a protocol
  
  `https://docs.swift.org/swift-book/LanguageGuide/Extensions.html`



