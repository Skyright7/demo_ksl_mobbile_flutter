## 一些不错的组件
```dart
var actionKey = GlobalKey();

BrnAppBar(
  title: '标题名称',
  leading: BrnDoubleLeading(
    first: BrnBackLeading(),
    second: BrnBackLeading(
      child: Image.asset(
        'assets/image/icon_navbar_close_bai.png',
        scale: 3.0,
        height: 20,
        width: 20,
      ),
    ),
  ),
  actions: BrnTextAction(
    '弹出菜单',
    key: actionKey,
    iconPressed: () {
      BrnPopupListWindow.showPopListWindow(context, actionKey,
          offset: 10, data: ["买卖买卖", "租赁租"]);
    },
  ),
);
```
效果是这样的
![](../../../Desktop/截屏2022-10-25 上午3.13.17.png)