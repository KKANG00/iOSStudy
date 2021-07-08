# iOSStudy

## AutoLayout
autoLayout? the rules that enable out User Interface Elements to know how they should be laid out.  
size class와 orientation에 맞는 자동 레이아웃 적용 (Responsive UIs)
 
 ### keywords
 Constraints (Pinning)  
 Alignment


## Xylophone
실로폰 연주 앱
AVAudioSession 라이브러리 사용을 위한 Apple Document 활용 연습  
https://developer.apple.com/documentation/avfaudio/avaudiosession  
https://developer.apple.com/documentation/foundation/bundle  

### keywords
Apple Developer Document


## Quizzler / Destini
퀴즈 맞히기 앱 / 여행 시나리오 앱

### keywords
MVC Pattern  
M: Data&Login  
V: User Interface  
C: Mediator  


## BMI Calculator
BMI 측정기 앱
[Swift] Class Inheritance
스토리보드 내에 Segue를 사용한 view 간의 화면 전환, 데이터 전달

### keywords
UIStoryboardSegue  
prepare 함수 (segue.identifier)  
NSObject  


## Egg Timer
에그 타이머 앱
[Swift]  Optionals

### keywords
1. Force Unwrapping
2. Check for nil value
3. Optional Binding
4. Nil coalescing Operator
5. Optional Chaining

struct vs class  
https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html  


## Tipsy
결제금액 팁 계산기 앱
UIStoryboardSegue, UIStepper 적용 예제

### keywords 
self.performSegue(withIdentifier: "goToResult", sender: self)  
self.dismiss(animated: true, completion: nil)  


## Clima
위치별 날씨정보 제공 앱
Networking, Jsonparsing, API, Core Location  
API: https://openweathermap.org/api (위치별 날씨 정보 api)  
[Swift] protocols, closure, DispatchQueue  

### keywords
protocol
delegate
DispatchQueue  


## ByteCoin
비트코인 가격정보 제공 앱
Networking, Jsonparsing, API  
API: https://docs.coinapi.io/#md-docs (환율에 따른 비트코인 가격정보 api)  
UIPickerView, UIPickerViewDataSource 적용 예제  

### keywords
delegate
extension


## FlashChat
회원 채팅 앱  
navigationBar, UITableView, Cocopods, Custom UI(using .xib)  
Firebase Authentication (Register, Login, Logout)  
Firebase Firestore (Create, Read, Query, Sort)  
Swift Package Manager

### keywords
Firebase  
Custom UI  
type casting  

ViewController LifeCycle  
- viewDidLoad  
- viewWillAppear  
- viewDidAppear  
- viewWillDisappear  
- viewDidDisappear  

Application LifeCycle  
- AppDelegate  
- SceneDelegate  
