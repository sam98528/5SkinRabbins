# 5SkinRobbins
![Static Badge](https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=Swift&logoColor=white)

---
## 설명 :

저희 팀은 iOS 애플리케이션인 "베스킨라빈스 주문 앱"을 개발했습니다. 이 애플리케이션은 Swift 언어를 사용하여 구현되었으며, 사용자들이 베스킨라빈스의 다양한 메뉴를 주문하고 관리할 수 있는 기능을 제공합니다. “5SkinRobbins 주문 앱"은 사용자들이 각각의 메뉴 종류를 쉽게 탐색하고 선택할 수 있는 직관적인 인터페이스를 제공합니다. 각 메뉴를 선택할 때마다 사용자는 장바구니에서 주문 내역을 확인할 수 있습니다. 특히, 아이스크림과 같은 메뉴의 경우, 사용자는 선택한 메뉴에 따라 다양한 맛을 선택할 수 있어 개인의 취향에 맞는 주문을 가능하게 합니다.

- Minimum Deployments : iOS 15.0
- Simulator :
    - iPhone 15 Pro (17.0, 17.2 , 17.4) ,
    - iPhone 13 mini (17.2),
    - iPhone 12 mini (16.0)

---

## 팀원 :

- 김민희
- 김한빛
- 이정복
- 이승원

---

## 와이어 프레임:
[Figma](https://www.figma.com/file/qFLetvkx3sYtCO3J5qrREs/5%EC%A1%B0_%ED%82%A4%EC%98%A4%EC%8A%A4%ED%81%AC?type=whiteboard&node-id=0%3A1&t=v2B1soZsxCMLAlKh-1)

| ![wire1](https://github.com/sam98528/5SkinRabbins/assets/12388297/6c9e6b32-bec8-410f-811c-83a53c341bbf) | ![wire2](https://github.com/sam98528/5SkinRabbins/assets/12388297/bb274989-0e14-4482-80b1-cdbdc97afee3)|
|----|----|

## 실제 작동화면  
| ![wire3](https://github.com/sam98528/5SkinRabbins/assets/12388297/d8646ae4-1524-4ff9-b1e7-01e2324ae46b) | ![wire4](https://github.com/sam98528/5SkinRabbins/assets/12388297/2a6f1cba-3bfc-4930-bb4d-654c9e3a4955)|
|---|---|

---

## 개발 기능 정리:

### Model - View - Controller 정의

| Model | Flavor | IceCream | Coffee | Beverage | Cake | Menu |
| --- | --- | --- | --- | --- | --- | --- |
| View/ Controller | MainViewController | MenuViewController | DetailsViewController | PaymentViewController |  |  |

### 팀원 역할 및 주요 기능 개발
#### 팀원 역할 
- **김민희 : 키오스크 메인 페이지 구현**
    1. StackView 로 라벨 묶어서 구현
    2. CollectionView로 배너작업
    3. UIButton으로 다크모드 구
- **이정복 : 메뉴 선택 화면 구현**
    1. **Title Label, CartButton, CollectionView 구성**
        - Interface Builder를 사용하여 각 UI 요소 구성
        - Stack View를 사용하여 Title Label와 CartButton을 레이아웃 조정, CollectionView Cell 내의 ProductName Label과 English Name Label을 Stack View로 구성하여 레이아웃 조정
    2. **CollectionView를 이용한 상품 나열**
        - UICollectionView를 사용하여 상품을 그리드 형태로 나열
        - 각 카테고리에 따라 다른 데이터 소스를 사용하여 셀 구성
    3. **장바구니 뱃지 표시**
        - UIButton을 확장하여 뱃지를 추가
        - 뱃지는 UILabel 구현, 장바구니에 담긴 상품의 수를 텍스트로 표시
        - 뱃지 애니메이션 효과 구현
    4. **상품 선택 및 상세 화면 이동**
        - UICollectionViewDelegate를 사용하여 상품을 선택했을 때의 동작을 구현
        - 선택된 상품에 대한 상세 정보를 표시하는 새로운 화면으로 이동하기 위해 UINavigationController를 사용
    5. **그라데이션 배경 추가**
        - CAGradientLayer를 사용하여 화면 하단에 그라데이션 배경을 추가
- **이승원 : 아이스크림 맛 선택 화면 구현**
    1. **선택한 아이스크림 다른 CollectionView에 보여지게 구현**
    2. **Button.menu 구현**
    3. **Delegate 패턴을 사용해서 데이터 전달**
- **김한빛: 키오스크 결제 화면(장바구니) 구현**
    1. FooterView
        1. 총 금액과 주문하기, 취소하기 버튼
    2. SubView
        1. 장바구니가 비어있을 경우, 화면 중앙에 장바구니가 비어있다는 메세지를 띄우는 기능 구현
#### 주요 기능 
1. **CollectionView 사용 및 구현**
    - **FlowLayout를 사용하여 원하는 배치 사이즈 조정.**
    - **Paging Control을 사용하여 Paging 처리**
2. UIImage에 UITapGestureRecognizer 로 다른페이지로 넘어가는 부분 구현
3. TableView 에 선택된 제품들 표시
    1. 제품의 정보
    2. +,- 버튼으로 제품의 갯수를 수정할 수 있는 버튼
4. **세그먼트 컨트롤로 상단 메뉴 카테고리 구성**
    - UISegmentedControl을 사용하여 다양한 카테고리를 표시
    - 세그먼트의 값이 변경될 때마다 해당하는 카테고리의 상품을 로드하도록 구현
    

## 겪었던 문제점 및 소감 :

- 김민희 :
    1. UIImageVIew에 UITapGestureRecognizer 로 연결했는데 Image 위에 Label를 얹으면 제스쳐가 인식이안됬다 이부분은 해결이안된부분이다
    2. Carousel로 무한회전하는 배너 구현을 하고싶었으나 어려워서 구현하지못했다 
    3. 오토레이아웃으로 ImageView들끼리 위치 잡는부분이 어려워서 한참고생해서 잡아뒀으나 잘못잡은부분이였다 지금은 반밖에 이해못했지만 해결하였다
- 이정복 :
    1. 커스텀 폰트 사용 오류 (info.plist) 파일
- 이승원 :
    1. **Github Merge 오류 ( Conflict를 잘 확인하고 Merge를 했지만, 문제 발생) -> 파일 로컬에서 merge 후 , 새로운 Branch 생성.**
    2. **CollectionView Paging 처리 -> Data 재구성**
- **김한빛 :**
    1. 데이터 주고 받는 오류
    장바구니 페이지와 메뉴 페이지에 데이터를 양쪽에서 서로 받아서 사용해야 했었는데, 초반 코드에서는 데이터를 주고 받는 것이 복잡하고, 어려웠다. → 
    2. 스토리보드로 만든 레이아웃을 특정 조건에 따라서 바꾸려면 코드와 스토리보드를 같이 사용해야 하는데, 잘못 설정하면 제약조건에 걸려서 어려움이 있었다.
    3. 초반에 git 을 add하거나 commit 할 때, 내가 수정할 파일에서 해줘야하는데, 헷갈려서 이상한 파일에 add 하기도 했다..
    4. 만들면 만들수록 부족한 점이 보이고,
    필요한 기능들이 보여서 쉽지 않았던 것 같다.
