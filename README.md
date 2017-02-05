# tiny.swift


## sample

### Foundation

#### localized

`"OK".localized`

#### DispatchQueue

`DispatchQueue.runningMain(after: 3) {	}`

***

### UIKit

####  UIAlertController
`UIAlertController(title: "welcome").addOk().show()`

auto close after 3 sconds
`UIAlertController(title: "welcome").show()`

### UserNotifications

#### UNUserNotificationCenter
`UNUserNotificationCenter.request(options: [.alert, .sound]).title("didFinishLaunching").show()`