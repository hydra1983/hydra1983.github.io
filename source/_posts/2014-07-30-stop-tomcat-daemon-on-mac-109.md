title: Stop tomcat daemon on Mac 10.9
date: 2014-07-30 11:23:25
category: "my tech"
tags: [Mac,OSX,tomcat]
---

```shell
cd /Library/LaunchDaemons
sudo launchctl unload org.apache.tomcat.plist
```
