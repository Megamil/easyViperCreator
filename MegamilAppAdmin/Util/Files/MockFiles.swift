//
//  MockFiles.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 03/09/21.
//

import Foundation

extension MockFiles {

    func getViewContent(name: String) -> String {
        return replace(text: self.mockView, name: name)
    }
    
    func getViewTableContent(name: String) -> String {
        return replace(text: self.mockViewTable, name: name)
    }
    
    func getStoryboardContent(name: String) -> String {
        return replace(text: self.mockStoryboard, name: name)
    }

    func getStoryboardTableContent(name: String) -> String {
        return replace(text: self.mockStoryboardTableView, name: name)
    }
    
    func getStoryboardScrollContent(name: String) -> String {
        return replace(text: self.mockStoryboardScroll, name: name)
    }
    
    func getInteractorContent(name: String) -> String {
        return replace(text: self.mockInteractor, name: name)
    }
    
    func getPresenterContent(name: String) -> String {
        return replace(text: self.mockPresenter, name: name)
    }
    
    func getEntityContent(name: String) -> String {
        return replace(text: self.mockEntity, name: name)
    }
    
    func getRouterContent(name: String) -> String {
        return replace(text: self.mockRouter, name: name)
    }
    
    func getExampleContent(name: String) -> String {
        return replace(text: self.mockExample, name: name)
        
    }
    
    func replace(text: String,name: String) -> String {
        var text = text
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        
        text = text.replacingOccurrences(of: nameKey, with: NSFullUserName())
        text = text.replacingOccurrences(of: dateKey, with: dateString)
        text = text.replacingOccurrences(of: yearKey, with: yearString)
        return text.replacingOccurrences(of: passKey, with: name)
    }
    
}

class MockFiles {
    
    let passKey = "ModuleViper"
    let nameKey = "_NAME_"
    let dateKey = "_DATE_"
    let yearKey = "_YEAR_"

    let mockView =
"""
//
//  ModuleViperVC.swift
//
//  Created by _NAME_ on _DATE_.
//  Copyright © _YEAR_ _NAME_. All rights reserved.
//

import UIKit

class ModuleViperVC: UIViewController {
    
    var presenter: ModuleViperPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.presenter?.actionContinue()
    }
    
    
}

// MARK: - Funcs
extension ModuleViperVC {
    
    func setupView() {
        
        self.presenter?.getData()
        
    }
    
}
"""
    
    let mockViewTable =
"""
//
//  ModuleViperVC.swift
//
//  Created by _NAME_ on _DATE_.
//  Copyright © _YEAR_ _NAME_. All rights reserved.
//

import UIKit

class ModuleViperVC: UIViewController {
    
    var presenter: ModuleViperPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.presenter?.actionContinue()
    }
    
    
}

// MARK: - Funcs
extension ModuleViperVC {
    
    func setupView() {
        
        self.presenter?.getData()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
    }
    
}

// MARK: - Funcs
extension ModuleViperVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView!.dequeueReusableCell(withIdentifier: "simpleCell")!
        cell.textLabel?.text = "Line /(indexPath.row)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}

"""
    
    let mockStoryboard =
"""
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="18122" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <device id="retina6_1" orientation="portrait" appearance="light"/>
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="18093"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="System colors in document resources" minToolsVersion="11.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Module ViperVC-->
        <scene sceneID="ion-V3-sub">
            <objects>
                <viewController storyboardIdentifier="ModuleViperVC" id="ir3-Ng-c7l" customClass="ModuleViperVC" customModule="ViperApp" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="2G7-vD-CWv">
                        <rect key="frame" x="0.0" y="0.0" width="414" height="896"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="ModuleViper" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="1v5-wG-7zj">
                                <rect key="frame" x="159" y="437.5" width="96" height="21"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <nil key="textColor"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="system" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="plS-U3-vS9">
                                <rect key="frame" x="16" y="816" width="382" height="30"/>
                                <constraints>
                                    <constraint firstAttribute="height" constant="30" id="GHS-f9-1jB"/>
                                </constraints>
                                <state key="normal" title="Continue..."/>
                                <connections>
                                    <action selector="actionContinue:" destination="ir3-Ng-c7l" eventType="touchUpInside" id="X1A-xC-5gu"/>
                                </connections>
                            </button>
                        </subviews>
                        <viewLayoutGuide key="safeArea" id="HEE-el-K4C"/>
                        <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                        <constraints>
                            <constraint firstItem="HEE-el-K4C" firstAttribute="trailing" secondItem="plS-U3-vS9" secondAttribute="trailing" constant="16" id="HSc-CI-Iw9"/>
                            <constraint firstItem="HEE-el-K4C" firstAttribute="bottom" secondItem="plS-U3-vS9" secondAttribute="bottom" constant="16" id="KI9-ax-f2D"/>
                            <constraint firstItem="plS-U3-vS9" firstAttribute="leading" secondItem="HEE-el-K4C" secondAttribute="leading" constant="16" id="L2b-5C-gNB"/>
                            <constraint firstItem="1v5-wG-7zj" firstAttribute="centerY" secondItem="2G7-vD-CWv" secondAttribute="centerY" id="ZtB-PM-kO4"/>
                            <constraint firstItem="1v5-wG-7zj" firstAttribute="centerX" secondItem="2G7-vD-CWv" secondAttribute="centerX" id="hX9-Lc-7Rf"/>
                        </constraints>
                    </view>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="ACA-aw-rUd" userLabel="First Responder" customClass="UIResponder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="29" y="123"/>
        </scene>
    </scenes>
    <resources>
        <systemColor name="systemBackgroundColor">
            <color white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
        </systemColor>
    </resources>
</document>
"""
    
    let mockStoryboardScroll =
"""
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="19455" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <device id="retina6_1" orientation="portrait" appearance="light"/>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="19454"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="System colors in document resources" minToolsVersion="11.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Module ViperVC-->
        <scene sceneID="ion-V3-sub">
            <objects>
                <viewController storyboardIdentifier="ModuleViperVC" id="ir3-Ng-c7l" customClass="ModuleViperVC" customModule="ViperApp" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="2G7-vD-CWv">
                        <rect key="frame" x="0.0" y="0.0" width="414" height="1500"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <scrollView clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="scaleToFill" translatesAutoresizingMaskIntoConstraints="NO" id="XbD-Gl-e4Q">
                                <rect key="frame" x="0.0" y="0.0" width="414" height="1500"/>
                                <subviews>
                                    <view contentMode="scaleToFill" translatesAutoresizingMaskIntoConstraints="NO" id="JRd-65-7eh">
                                        <rect key="frame" x="0.0" y="0.0" width="414" height="1500"/>
                                        <subviews>
                                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Top Label" textAlignment="center" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="TjO-Rl-eDM">
                                                <rect key="frame" x="32" y="32" width="350" height="21"/>
                                                <constraints>
                                                    <constraint firstAttribute="height" constant="21" id="KtT-Ke-ulY"/>
                                                </constraints>
                                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                                <nil key="textColor"/>
                                                <nil key="highlightedColor"/>
                                            </label>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="system" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="bFZ-aD-30R">
                                                <rect key="frame" x="32" y="1428" width="350" height="40"/>
                                                <color key="backgroundColor" red="1" green="0.45098039220000002" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="calibratedRGB"/>
                                                <constraints>
                                                    <constraint firstAttribute="height" constant="40" id="Y6E-78-v3Z"/>
                                                </constraints>
                                                <color key="tintColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                                <state key="normal" title="Button"/>
                                                <buttonConfiguration key="configuration" style="plain" title="Continuar"/>
                                                <connections>
                                                    <action selector="actionContinue:" destination="ir3-Ng-c7l" eventType="touchUpInside" id="A7Q-a3-vLC"/>
                                                </connections>
                                            </button>
                                        </subviews>
                                        <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                                        <constraints>
                                            <constraint firstAttribute="trailing" secondItem="bFZ-aD-30R" secondAttribute="trailing" constant="32" id="0aH-1b-2gb"/>
                                            <constraint firstAttribute="bottom" secondItem="bFZ-aD-30R" secondAttribute="bottom" constant="32" id="Zvr-s4-Ovj"/>
                                            <constraint firstAttribute="trailing" secondItem="TjO-Rl-eDM" secondAttribute="trailing" constant="32" id="fZq-5e-qAh"/>
                                            <constraint firstItem="TjO-Rl-eDM" firstAttribute="top" secondItem="JRd-65-7eh" secondAttribute="top" constant="32" id="lG4-id-79R"/>
                                            <constraint firstItem="TjO-Rl-eDM" firstAttribute="leading" secondItem="JRd-65-7eh" secondAttribute="leading" constant="32" id="nYg-Kh-ONp"/>
                                            <constraint firstItem="bFZ-aD-30R" firstAttribute="leading" secondItem="JRd-65-7eh" secondAttribute="leading" constant="32" id="olT-5s-eyP"/>
                                            <constraint firstItem="bFZ-aD-30R" firstAttribute="top" secondItem="TjO-Rl-eDM" secondAttribute="bottom" constant="1375" id="q9C-zU-ihJ"/>
                                        </constraints>
                                    </view>
                                </subviews>
                                <constraints>
                                    <constraint firstItem="JRd-65-7eh" firstAttribute="top" secondItem="XbD-Gl-e4Q" secondAttribute="top" id="f4i-bh-T2I"/>
                                    <constraint firstAttribute="bottom" secondItem="JRd-65-7eh" secondAttribute="bottom" id="jXE-iu-hz9"/>
                                    <constraint firstItem="JRd-65-7eh" firstAttribute="leading" secondItem="XbD-Gl-e4Q" secondAttribute="leading" id="kvK-4b-pp5"/>
                                    <constraint firstAttribute="trailing" secondItem="JRd-65-7eh" secondAttribute="trailing" id="sHu-qO-vhW"/>
                                    <constraint firstItem="JRd-65-7eh" firstAttribute="width" secondItem="XbD-Gl-e4Q" secondAttribute="width" id="vk6-57-G3T"/>
                                    <constraint firstItem="JRd-65-7eh" firstAttribute="height" secondItem="XbD-Gl-e4Q" secondAttribute="height" priority="250" id="z7c-Nq-h4q"/>
                                </constraints>
                            </scrollView>
                        </subviews>
                        <viewLayoutGuide key="safeArea" id="HEE-el-K4C"/>
                        <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                        <constraints>
                            <constraint firstItem="XbD-Gl-e4Q" firstAttribute="top" secondItem="2G7-vD-CWv" secondAttribute="top" id="KAB-lJ-d7K"/>
                            <constraint firstItem="XbD-Gl-e4Q" firstAttribute="trailing" secondItem="HEE-el-K4C" secondAttribute="trailing" id="aM8-sC-L2V"/>
                            <constraint firstAttribute="bottom" secondItem="XbD-Gl-e4Q" secondAttribute="bottom" id="jdq-LT-Qbe"/>
                            <constraint firstItem="XbD-Gl-e4Q" firstAttribute="leading" secondItem="HEE-el-K4C" secondAttribute="leading" id="jfa-jS-YaW"/>
                        </constraints>
                    </view>
                    <size key="freeformSize" width="414" height="1500"/>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="ACA-aw-rUd" userLabel="First Responder" customClass="UIResponder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="28.985507246376812" y="122.54464285714285"/>
        </scene>
    </scenes>
    <resources>
        <systemColor name="systemBackgroundColor">
            <color white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
        </systemColor>
    </resources>
</document>
"""
    
    let mockStoryboardTableView =
"""
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="19455" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <device id="retina6_1" orientation="portrait" appearance="light"/>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="19454"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="System colors in document resources" minToolsVersion="11.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Module ViperVC-->
        <scene sceneID="ion-V3-sub">
            <objects>
                <viewController storyboardIdentifier="ModuleViperVC" id="ir3-Ng-c7l" customClass="ModuleViperVC" customModule="ViperApp" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="2G7-vD-CWv">
                        <rect key="frame" x="0.0" y="0.0" width="414" height="1500"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <tableView clipsSubviews="YES" contentMode="scaleToFill" restorationIdentifier="simpleCell" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" separatorStyle="default" rowHeight="-1" estimatedRowHeight="-1" sectionHeaderHeight="-1" estimatedSectionHeaderHeight="-1" sectionFooterHeight="-1" estimatedSectionFooterHeight="-1" translatesAutoresizingMaskIntoConstraints="NO" id="bxx-zE-XBm">
                                <rect key="frame" x="0.0" y="0.0" width="414" height="1500"/>
                                <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                                <prototypes>
                                    <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" insetsLayoutMarginsFromSafeArea="NO" selectionStyle="blue" hidesAccessoryWhenEditing="NO" indentationLevel="1" indentationWidth="0.0" reuseIdentifier="simpleCell" id="vhA-Zy-ECq">
                                        <rect key="frame" x="0.0" y="44.5" width="414" height="43.5"/>
                                        <autoresizingMask key="autoresizingMask"/>
                                        <tableViewCellContentView key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" insetsLayoutMarginsFromSafeArea="NO" tableViewCell="vhA-Zy-ECq" id="GNY-KI-a8J">
                                            <rect key="frame" x="0.0" y="0.0" width="414" height="43.5"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                        </tableViewCellContentView>
                                    </tableViewCell>
                                </prototypes>
                            </tableView>
                        </subviews>
                        <viewLayoutGuide key="safeArea" id="HEE-el-K4C"/>
                        <color key="backgroundColor" systemColor="systemBackgroundColor"/>
                        <constraints>
                            <constraint firstAttribute="bottom" secondItem="bxx-zE-XBm" secondAttribute="bottom" id="FHu-6g-Aei"/>
                            <constraint firstItem="bxx-zE-XBm" firstAttribute="leading" secondItem="HEE-el-K4C" secondAttribute="leading" id="L8d-74-QIM"/>
                            <constraint firstItem="bxx-zE-XBm" firstAttribute="trailing" secondItem="HEE-el-K4C" secondAttribute="trailing" id="XA1-qb-tat"/>
                            <constraint firstItem="bxx-zE-XBm" firstAttribute="top" secondItem="2G7-vD-CWv" secondAttribute="top" id="zLR-0u-1c8"/>
                        </constraints>
                    </view>
                    <size key="freeformSize" width="414" height="1500"/>
                    <connections>
                        <outlet property="tableView" destination="bxx-zE-XBm" id="8ad-sJ-QvE"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="ACA-aw-rUd" userLabel="First Responder" customClass="UIResponder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="28.985507246376812" y="122.54464285714285"/>
        </scene>
    </scenes>
    <resources>
        <systemColor name="systemBackgroundColor">
            <color white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
        </systemColor>
    </resources>
</document>
"""

    let mockInteractor =
"""
//
//  ModuleViperInteractor.swift
//
//  Created by _NAME_ on _DATE_.
//  Copyright © _YEAR_ _NAME_. All rights reserved.
//

import Foundation

class ModuleViperInteractor {
    
    var presenter: ModuleViperPresenter?
    
    func getData(callBack: @escaping (Bool?) -> Void) {
     
//         do {
//             let obj = try JSONDecoder().decode(objEntity.self, from: result)
//             callBack(obj)
//         } catch {
//             print("*************** Decodable error ***************")
//             print(error)
//             print(error.localizedDescription)
//             print("*************** Decodable error ***************")
//             callBack(nil)
//         }
        
        callBack(true)
        
    }
    
}
"""
    
    let mockPresenter =
"""
//
//  ModuleViperPresenter.swift
//
//  Created by _NAME_ on _DATE_.
//  Copyright © _YEAR_ _NAME_. All rights reserved.
//

import Foundation

class ModuleViperPresenter {
    
    weak var view: ModuleViperVC?
    var router: ModuleViperRouter?
    var interactor: ModuleViperInteractor?
    
    init(view: ModuleViperVC?, interactor: ModuleViperInteractor?, router: ModuleViperRouter?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

//MARK: Funcs
extension ModuleViperPresenter {
    
    func getData(){
        self.interactor?.getData() { status in
            if(status ?? false) {
                
            }
        }
    }
    
    func actionContinue() {
        self.router?.actionContinue()
    }
    
}
"""
    
    let mockEntity =
"""
//
//  ModuleViperEntity.swift
//
//  Created by _NAME_ on _DATE_.
//  Copyright © _YEAR_ _NAME_. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - ModuleViper
struct ModuleViper: Codable {
    
    let success: Bool?
    let msg: String?
    
}
"""
    
    let mockRouter =
"""
//
//  ModuleViperRouter.swift
//
//  Created by _NAME_ on _DATE_.
//  Copyright © _YEAR_ _NAME_. All rights reserved.
//

import UIKit

class ModuleViperRouter {
    
    var view: UIViewController?
    
    static func createModule() -> ModuleViperVC {
        let view = UIStoryboard(name: "ModuleViperVC", bundle: Bundle(for: ModuleViperVC.self)).instantiateViewController(withIdentifier: "ModuleViperVC") as! ModuleViperVC
        let router = ModuleViperRouter()
        let interactor = ModuleViperInteractor()
        let presenter = ModuleViperPresenter(view: view, interactor: interactor, router: router)
        router.view = view
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
}

// MARK: Funcs
extension ModuleViperRouter {
    
    func actionContinue() {
//        let newModule = NameModuleRouter.createModule()
//        self.view!.navigationController?.pushViewController(newModule, animated: true)
    }
    
}
"""
    
    let mockExample =
"""
Para usar, já num fluxo VIPER, coloque esse trecho em uma função no seu router.

    let ModuleViperRouter = ModuleViperRouter.createModule()
    self.view!.navigationController?.pushViewController(ModuleViperRouter, animated: true)

Caso queira criar um projeto novo, onde essa será a primeira tela siga os passos (Retirando SwiftUI):

Abra o Xcode, Vá no menu superior: -> File -> new -> Project
Selecione iOS -> App, Dê um nome e selecione: -> Interface Storyboard -> UIKit -> Swift e salve onde preferir.

Apague o arquivo SceneDelegate, mova a pasta gerada aqui para o projeto, marque Copy items if needed e click no Finish.

No AppDelegate apague todas funções, deixando somente a didFinishLaunchingWithOptions

Crie uma váriavel fora da função:
    var window: UIWindow?

Cole na função:

    let home = ModuleViperRouter.createModule()
    window?.rootViewController = home

Por fim abra o info.plist e apague ese trecho
<key>UIApplicationSceneManifest</key>
    <dict>
        <key>UIApplicationSupportsMultipleScenes</key>
        <false/>
        <key>UISceneConfigurations</key>
        <dict>
            <key>UIWindowSceneSessionRoleApplication</key>
            <array>
                <dict>
                    <key>UISceneConfigurationName</key>
                    <string>Default Configuration</string>
                    <key>UISceneDelegateClassName</key>
                    <string>$(PRODUCT_MODULE_NAME).SceneDelegate</string>
                    <key>UISceneStoryboardFile</key>
                    <string>Main</string>
                </dict>
            </array>
        </dict>
    </dict>
"""
    
}
