# iospublisher

iOS 项目发布到 AppStore 命令行工具

使用 fpccmd 编译本项目，fpccmd 可以在[这个链接](https://github.com/rarnu/fpccmd)获取

```
$ fpccmd M iospublisher.ppr
```

在 iOS 项目内使用编译后的命令即可完成发布

```
## 初始化发布信息
$ iospublisher init

## 手动编辑 iospub.cfg，需编辑的信息可以从成功导出的项目中的 exportOptions.plist 内获得

## 编译项目，并导出 ipa
$ iospublisher build

## 发布 ipa 到 AppStore
$ iospublisher build appstore

## 发布 ipa 到蒲公英
$ iospublisher build pgyer
```

- - -

为了更简便的完成配置，可以使用 GUI 工具，编译后直接双击使用即可

```
$ fpccmd M iospubgui.ppr C
```

![](https://github.com/rarnu/iospublisher/blob/master/Screenshot.png)

