---
layout: post
title: "如何升级Ubuntu Server的内核"
description: ""
category: "my tech" 
tags: [ubuntu, kernal]
---
{% include JB/setup %}

{% highlight bash %}
sudo apt-cache search linux-image
sudo apt-get install linux-image-{suffix}
{% endhighlight %}