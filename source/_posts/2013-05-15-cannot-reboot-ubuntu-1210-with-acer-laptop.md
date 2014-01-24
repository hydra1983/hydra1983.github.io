---
layout: post
title: "Cannot Reboot Ubuntu 12.10 on Acer Laptop"
description: ""
category: "my tech" 
tags: [ubuntu,acer,efi]
---

I installed ubuntu 12.10 server edition 64bit. When I want to reboot the system, I got stuck. 

After googled a lot, I got the answer:

```bash
sudo vi /etc/default/grub
```

<!--more-->

edit the line

```vim
GRUB_CMDLINE_LINUX=””
```
to

```vim
GRUB_CMDLINE_LINUX=”reboot=efi”
```
then

```bash
sudo shutdown -P now
```
and start the laptop.

Now, I can reboot correctly.
