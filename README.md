# iOSStudy

## AutoLayout
autoLayout? the rules that enable out User Interface Elements to know how they should be laid out.  
size class와 orientation에 맞는 자동 레이아웃 적용 (Responsive UIs)  
 
 ### keywords
 Constraints (Pinning)  
 Alignment


- - -
## Xylophone
실로폰 연주 앱
AVAudioSession 라이브러리 사용을 위한 Apple Document 활용  
[참고]  
https://developer.apple.com/documentation/avfaudio/avaudiosession  
https://developer.apple.com/documentation/foundation/bundle  

### keywords
Apple Developer Document  


- - -
## Quizzler / Destini
퀴즈 맞히기 앱 / 여행 시나리오 앱  

### keywords
MVC Pattern  
M: Data&Login  
V: User Interface  
C: Mediator  


- - -
## BMI Calculator
BMI 측정기 앱
[Swift] Class Inheritance  
스토리보드 내에 Segue를 사용한 view 간의 화면 전환, 데이터 전달  

### keywords
UIStoryboardSegue  
prepare 함수 (segue.identifier)  
NSObject  


- - -
## Egg Timer
에그 타이머 앱
Timer 활용  
[Swift]  Optionals, struct vs class  
[참고] https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html  

### keywords
1. Force Unwrapping
2. Check for nil value
3. Optional Binding
4. Nil coalescing Operator
5. Optional Chaining


- - -
## Tipsy
결제금액 팁 계산기 앱  
UIStoryboardSegue, UIStepper 적용  

### keywords 
self.performSegue(withIdentifier: "goToResult", sender: self)  
self.dismiss(animated: true, completion: nil)  


- - -
## Clima
위치별 날씨정보 제공 앱  
Networking, Jsonparsing, API, Core Location  
API: https://openweathermap.org/api (위치별 날씨 정보 api)  
[Swift] protocols, closure, DispatchQueue  

### keywords
protocol  
delegate  
DispatchQueue  


- - -
## ByteCoin
비트코인 가격정보 제공 앱  
Networking, Jsonparsing, API  
API: https://docs.coinapi.io/#md-docs (환율에 따른 비트코인 가격정보 api)  
UIPickerView, UIPickerViewDataSource 적용  

### keywords
delegate  
extension  


- - -
## FlashChat
회원 채팅 앱  
navigationBar, UITableView, Cocopods, Custom UI(using .xib)  
Firebase Authentication (Register, Login, Logout)  
Firebase Firestore (Create, Read, Query, Sort)  
Swift Package Manager  

### keywords
Firebase  

ViewController LifeCycle  
- viewDidLoad  
- viewWillAppear  
- viewDidAppear  
- viewWillDisappear  
- viewDidDisappear  

Application LifeCycle  
- AppDelegate  
- SceneDelegate  


- - -
## CollectionViewPractice
CollectionView 공부  
UICollectionViewDelegateFlowLayout 로 CollectionView의 layout을 customize  

### keywords
UICollectionViewDataSource  
UICollectionViewDelegateFlowLayout  


- - -
## SoSimpleMVVM
MVVM 패턴 공부  
![MVVM](https://media.vlpt.us/images/sso0022/post/5780c05c-3449-47e2-9984-71972eadff48/%EC%A0%9C%EB%AA%A9%EC%9D%84%20%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94._001%20(1).png "MVVM")
Model/View/ViewModel로 이루어져있는 새로운 디자인패턴  

1. 사용자 action → View → View Model (Command Pattern: 실행될 기능을 추상화, 캡슐화하여 한 클래스에서 여러 기능을 실행하도록 하는 패턴)
2. View Model  -(data update request)→ Model
3. Model -(updated data)→ View Model
4. ViewModel 받은 데이터 가공저장
5. View 자동갱신 (Data Binding View - View Model)

### more
Command Pattern  
Data Binding  


- - -
## myClima
기존 Clima 프로젝트와 Flash-Chat의 학습내용을 바탕으로 커스터마이징  
날씨정보를 검색해 화면에 쌓아 보여주는 앱  

Clima: openWeather API 통신 + Flash-Chat: Custom TableViewCell 을 활용한 화면 구성  

![](https://github.com/KKANG00/iOSStudy/blob/master/myClima/Simulator-Screen-Recording.gif)


- - -
## Todoey
데이터 저장이 가능한 할 일 목록을 만들고 관리하는 앱  
Local Data Persistance

### keywords
UserDefaults
NSCoder
