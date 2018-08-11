# iospublisher

iOS 项目发布到 AppStore 命令行工具

使用 fpccmd 编译本项目，fpccmd 可以在[这个链接](https://github.com/rarnu/fpccmd)获取

```
$ fpccmd M iospublisher.ppr
```

在 iOS 项目内使用编译后的命令即可完成发布

```
$ iospublisher SampleProject SampleSchema 1 user password
```

### 参数说明

```
1: 项目名称
2: 要编译的项目内 Schema 名称
3: 是否启用 bitcode，0为不启用，1这为启用
4: 用于上传到AppStore的帐号
5: 用于上传到AppStore的密码
```

