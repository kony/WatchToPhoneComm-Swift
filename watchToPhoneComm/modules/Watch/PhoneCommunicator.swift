import Foundation
import WatchConnectivity
import WatchKit

class PhoneCommunicator : NSObject, WCSessionDelegate {
    
    static var sharedInstance:PhoneCommunicator? = nil;
    var session:WCSession? = nil;
    
    override init() {
        super.init();
        session = WCSession.defaultSession();
        if(session!.delegate == nil){
            session!.delegate = self;
            session!.activateSession();
        }
    }
    
    class func getSharedInstance() -> (PhoneCommunicator) {
        if(sharedInstance == nil){
            sharedInstance =  PhoneCommunicator();
        }
        return sharedInstance!;
    }
    
    func pingPhone() {
        if WCSession.isSupported() {
            print("session is supported on watch");
            if(session!.reachable){
                print("session reachable on phone");
                session!.sendMessage(["requestId": "sayHello"], replyHandler: { (response) -> Void in
                        print("in reply handler");
                        print("\(response["reply"]!)");
                    },
                    errorHandler: { (error) -> Void in
                        print("in error callback");
                        print("\(error)")
                })
            }
        }
    }
}


