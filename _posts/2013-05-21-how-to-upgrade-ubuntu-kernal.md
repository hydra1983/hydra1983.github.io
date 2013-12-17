---
layout: post
title: "如何升级 Ubuntu Server 12.10 的内核"
description: ""
category: "my tech" 
tags: [ubuntu, kernal]
---
{% include JB/setup %}

```bash
sudo apt-cache search linux-image
sudo apt-get install linux-image-{suffix}
```