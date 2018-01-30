//
//  Created by Patrick cremin on 8/2/17.
//

import Foundation
import BMSCore
import BMSAnalytics
import CoreLocation

// TextToSpeech
@objc(RNAnalytics)
class RNAnalytics: NSObject {
  
  var logger: BMSAnalyticsAPI.Logger!
  
  
  private override init() {
  }
  
  // TODO [patrick] allow users to set region and all Analytics.initialize() parameters
  // TODO [patrick] allow users to set loging configuration
  // TODO [patrick] collectLocation should be configurable true|false, but need to check requestWhenInUseAuthorization().
  //        See: https://developer.apple.com/documentation/corelocation/cllocationmanager/1620562-requestwheninuseauthorization
  
  @objc func initialize(_ appName: String, apiKey: String) -> Void {
    BMSClient.sharedInstance.initialize(bluemixRegion: BMSClient.Region.usSouth)
    
    Analytics.initialize(appName: appName, apiKey: apiKey, hasUserContext: true, collectLocation: false, deviceEvents: .lifecycle, .network)
    
    self.logger = Logger.logger(name: "Analytics")
    
    Analytics.isEnabled = true
    Logger.isLogStorageEnabled = true
    Logger.isInternalDebugLoggingEnabled = true
    //Logger.logLevelFilter = LogLevel.debug
  }
  
  @objc func setUserIdentity(_ userIdentity: String) -> Void {
    Analytics.userIdentity = userIdentity
  }

  
  @objc func disable() -> Void {
    Analytics.isEnabled = false
  }
  
  @objc func enable() -> Void {
    Analytics.isEnabled = true
  }
  
  
  @objc func logAnalytics(_ eventObject: [String : Any]) -> Void {
    Analytics.log(metadata: eventObject)
  }
  
  @objc func logFatal(_ message: String) -> Void {
    logger.fatal(message: message)
  }
  
  @objc func logError(_ message: String) -> Void {
    logger.error(message: message)
  }
  
  @objc func logWarn(_ message: String) -> Void {
    logger.warn(message: message)
  }
  
  @objc func logDebug(_ message: String) -> Void {
    logger.debug(message: message)
  }
  
  @objc func logInfo(_ message: String) -> Void {
    logger.info(message: message)
  }
 
  @objc func logLocation() -> Void {
    Analytics.logLocation();
  }
  
  /* NOTE
     By default, the Logger class will print its logs to Xcode console. If is advised to disable Logger output for applications built in release mode. In order to do so add a debug flag named RELEASE_BUILD to your release build configuration. One way of doing so is adding -D RELEASE_BUILD to the Other Swift Flags section of the project build configuration.
 */
  // TODO [patrick] the callback can only occur once, so if there are 2 errors only the first will be reported in the callback.  If this is a big issue then use events instead of a callback (or a something that waits for both sends to complete)
  @objc func send(_ errorCallback: @escaping RCTResponseSenderBlock ) -> Void {
    Logger.send(completionHandler: { (response: Response?, error: Error?) in
      if let response = response {
        self.logger.debug(message: "Status code: \(String(describing: response.statusCode))")
        self.logger.debug(message: "Response: \(String(describing: response.responseText))")
      }
      if let error = error {
        self.logger.error(message: "Failed to send logs. Error: \(error)")
        errorCallback([error])
      }
    })
    
    Analytics.send(completionHandler: { (response: Response?, error: Error?) in
      if let error = error {
        self.logger.error(message: "Failed to send analytics. Error: \(error)")
        errorCallback([error])
      }
    })
  }
}

