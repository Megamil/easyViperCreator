//
//  MockFiles.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 03/09/21.
//

import Foundation

extension MockFiles {

    func getViewContent(name: String) -> String {
        return self.mockView.replacingOccurrences(of: passKey, with: name)
    }
    
    func getStoryboardContent(name: String) -> String {
        return self.mockStoryboard.replacingOccurrences(of: passKey, with: name)
    }
    
    func getInteractorContent(name: String) -> String {
        return self.mockInteractor.replacingOccurrences(of: passKey, with: name)
    }
    
    func getPresenterContent(name: String) -> String {
        return self.mockPresenter.replacingOccurrences(of: passKey, with: name)
    }
    
    func getEntityContent(name: String) -> String {
        return self.mockEntity.replacingOccurrences(of: passKey, with: name)
    }
    
    func getRouterContent(name: String) -> String {
        return self.mockRouter.replacingOccurrences(of: passKey, with: name)
    }
    
    func getExampleContent(name: String) -> String {
        return self.mockExample.replacingOccurrences(of: passKey, with: name)
    }
    
}

class MockFiles {
    
    let passKey = "ModuleViper"

    let mockView =
"""
//
//  ModuleViperVC.swift
//  Megamil
//
//  Created by Eduardo dos santos on 03/09/21.
//  Copyright © 2021 Eduardo dos santos. All rights reserved.
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

    let mockInteractor =
"""
//
//  ModuleViperInteractor.swift
//  Metas
//
//  Created by Eduardo dos santos on 12/08/20.
//  Copyright © 2020 Eduardo dos santos. All rights reserved.
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
//  Metas
//
//  Created by Eduardo dos santos on 12/08/20.
//  Copyright © 2020 Eduardo dos santos. All rights reserved.
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
//  Megamil
//
//  Created by Eduardo dos santos on 03/09/21.
//  Copyright © 2021 Eduardo dos santos. All rights reserved.
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
//  Megamil
//
//  Created by Eduardo dos santos on 03/09/21.
//  Copyright © 2021 Eduardo dos santos. All rights reserved.
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
