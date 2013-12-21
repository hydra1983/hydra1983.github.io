---
layout: post
title: "解压缩多个iso文件的批处理脚本"
description: ""
category: "my tech" 
tags: [batch, iso, 7z]
---
{% include JB/setup %}

7zManager 没有批量解压的功能，只好通过批处理脚本来完成

```
REM 解压到同名目录中
FOR %I IN (*.iso) DO 7z x -o%~nI %I
```

所需的命令行工具可以在[这里](/uploads/7zCLI_920.zip)下载到