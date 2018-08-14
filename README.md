# iospublisher

iOS 项目发布到 AppStore 命令行工具

使用 fpccmd 编译本项目，fpccmd 可以在[这个链接](https://github.com/rarnu/fpccmd)获取

```
$ fpccmd M iospublisher.ppr
```

在 iOS 项目内使用编译后的命令即可完成发布

```
$ iospublisher init
## Edit iospub.cfg
$ iospublisher build
## or
$ iospublisher build upload
```

