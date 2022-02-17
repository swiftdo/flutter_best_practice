# flutter_best_practice

## 运行效果

![](http://blog.loveli.site/mweb/tutieshi_592x1280_49s.gif)

图片如果没有显示出来，请点击这里: [http://blog.loveli.site/mweb/tutieshi_592x1280_49s.gif](http://blog.loveli.site/mweb/tutieshi_592x1280_49s.gif)

## 下载地址

蒲公英下载地址：[https://www.pgyer.com/eLAq](https://www.pgyer.com/eLAq)

如果你不想运行代码，想体验线真机，请把你的 UDID 发给我，关注 **OldBirds公众号**，回复 "Rss+你的UDID" 即可（顺便可入Flutter微信群）,
> 如何获取 UDID, 请点击[跳转这里](https://www.pgyer.com/tools/udid)

## 规划

* [x] rss 添加
* [x] rss 文章列表
* [x] rss 删除
* [x] rss 文章详情
* [x] rss 分类管理
* [ ] 收藏
* [ ] 历史
* [ ] OPML 导入和导出
* [ ] 应用分享
* [ ] 应用评价

## 代码生成

请用 2.8.0 以上的 flutter 版本，建议使用 [FVM 管理 flutter 环境](https://oldbird.run/flutter/t7-fvm.html)

```shell
fvm flutter pub run build_runner build --delete-conflicting-outputs
fvm flutter pub run build_runner watch --delete-conflicting-outputs
```

## Rss 知识点

认识 RSS

* RSS 是什么
* RSS 的数据类型
* RSS 的导出和导入[OPML](https://cloud.tencent.com/developer/article/1580587)
* RSS 和 ATOM 两种订阅方式的对比
* RSS 解决了什么问题

RSS 更高效地获取信息，不在多个应用间来回切换，另一方面拒绝算法给我们推荐的内容，只看主动订阅的内容

RSS 可能是抵御算法推荐的最后一方净土

## 单元测试

1、将 test 或者 flutter_test 加入依赖；

2、创建测试文件；

3、创建一个要测试的类；

4、为创建的类写一个测试；

5、整合多个测试到一个 group；

6、执行测试。

关于单元测试的更多内容，可移步至 [单元测试](https://flutter.cn/docs/cookbook/testing/unit/introduction) 的文档。

## 自动打包

* 支持持续集成，具体步骤可参考：[Github Actions 免费构建 Flutter iOS 包](https://oldbird.run/flutter/github-actions-build-flutter-ios.html)

## 参考：

* [如何使用RSS](https://www.ruanyifeng.com/blog/2006/01/rss.html)
* [RSS 教程](https://www.runoob.com/rss/rss-tutorial.html)
* [ATOM和RSS的区别](https://www.cnblogs.com/yjmyzz/archive/2009/02/19/1393972.html)
* [RSS,ATOM,FEED是什么有什么区别](https://seonoco.com/blog/rss-atom-feed-different)
* [订阅基础：RSS、ATOM、FEED、聚合、供稿、合烧与订阅](https://blog.csdn.net/hshl1214/article/details/50580073)
* [高效获取信息，你需要这份 RSS 入门指南](https://sspai.com/post/56391)
* [RSS：一个软件阅读全网内容，有了它真的可以为所欲为](https://zhuanlan.zhihu.com/p/356775404)