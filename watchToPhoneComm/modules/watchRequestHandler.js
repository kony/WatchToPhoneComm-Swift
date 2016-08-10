function cleanUp() {
    kony.print("cleaning up ...");
}

function pre_init() {
    kony.application.setApplicationCallbacks({
        onwatchrequest: JSWcallBackH2
    });
}

//Type your code here
function JSWcallBackH2(dict, replyObj) {
    var taskID = kony.application.beginBackgroundTask("UniqueTaskID", cleanUp);
    var retDict = {};
  	{
        if (dict.requestId == "sayHello") {
            retDict = {
              	"reply": "Hello, this is your iphone"
            };
          
            kony.print("return dict:" + retDict);
            replyObj.executeWithReply(retDict);
            kony.application.endBackgroundTask(taskID);
        } 
    }
}