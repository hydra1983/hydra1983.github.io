---
layout: post
title: "Cannot Reboot Ubuntu 12.10 on Acer Laptop"
description: ""
category: "my tech" 
tags: [ubuntu,acer,efi]
---
{% include JB/setup %}

I installed ubuntu 12.10 server edition 64bit. When I want to reboot the system, I got stuck. 

After googled a lot, I got the answer:
{% highlight bash %}
sudo vi /etc/default/grub
{% endhighlight %}
edit the line
{% highlight vim %}
GRUB_CMDLINE_LINUX=””
{% endhighlight %}
to
{% highlight vim %}
GRUB_CMDLINE_LINUX=”reboot=efi”
{% endhighlight %}   
then
{% highlight bash %}
sudo shutdown -P now
{% endhighlight %}
and start the laptop.

Now, I can reboot correctly.