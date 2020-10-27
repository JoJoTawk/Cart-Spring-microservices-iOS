#   What is VIPER ?

Viper is an architecture that divides a feature implementation into five distinct layer in one module. Each character of VIPER represents a different layer;

```
    V: View
    I: Interactor
    P: Presenter
    E: Entity
    R: Router

```
    Each layer has a distinct role in the module. In VIPER, I think implementing a feature like building a lego from different parts. Let’s take a look at each layer,

 **View**

    View is a dummy object receiving touch events most of the time. Instead of MVC’s massive view controller with thousands lines of codes, basically all service related codes and decision makings should not exist in it. For example, when a touch event was received from the user, view object should notify the presenter like “My dear presenter, a touch was received from user and I don’t know what I should do with it”
    
**Presenter**

    I think presenter is the heart of the VIPER module. Only layer in the module that communicates with all other layers. Basically all decision makings should be handled in the presenter. After the decision, presenter has to communicate with the layer required. For example, after notified by view with touch event, presenter should decide what should be done next. Does screen need to update it’s UI ? Then tell view layer to update UI with given info. Should a data be fetch from remove server ? Then tell interactor to fetch it. Similarly, does app need to navigate to other screen ? Then tell router to navigate which screen it is.
    
**Interactor**

    Interactor contains business logic and it’s mostly responsible from api calls. It builds request from parameters and creates objects by mapping response. After finishing service connection, it notifies presenter like “Hey presenter, these are puppies you are looking for” or “I’m sorry, I am not able to fetch your needs at this moment”. You get the idea.
**Router**
    
    You need segue to another module ? Tell router which module it should be presented next and leave the rest to it. Router needs a UINavigationController instance to do such navigation stuff. Also I think that router should be responsible for showing alerts since UIAlertController is used with present method.
    
**Entity**

    Plain data objects mainly driven by interactor. No more, no less.
    
<p align="center">
      <img src="../../iOS-Cart/1_rnmJYsedkv4jybUeQxJI4g.png" width="350" title="hover text">
</p>
    
![Alt text](../../iOS-Cart/1_rnmJYsedkv4jybUeQxJI4g.png?raw=true)
