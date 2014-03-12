---
title: 在 Debian 6 中安装并调试金笛 USB 短信猫 M1206B
date: 2014-03-12 14:07:54
category: "my tech"
tags: [Debian,短信猫,USB,minicom,gnokii]
---

**本文中的所有命令均在 root 帐户下执行**

## 准备工作

* 确定SIM卡安装到了短信猫中
* 确定短信猫正确连接到了计算机

<!--more-->

## 检查设备

```bash
root@dev6:~# dmesg|grep tty
console [tty0] enabled
...
usb 1-3.2: pl2303 converter now attached to ttyUSB0
...
```

表明计算机已经识别了短信猫

## 安装工具包

### 安装 minicom

#### 安装

```bash
apt-get install minicom
```

#### 设置

```bash
minicom -s
```
设置信息如下：
```
 Serial port setup =>
   Serial Device : /dev/ttyUSB0
   Bps/Par/Bits  : 15200 8N1
```

### 安装 gnokii

#### 安装

```bash
apt-get install 
```

#### 设置

保存如下内容到 ~/.config/gnokii/config 文件中

```
[global]
port=/dev/ttyUSB0
model=AT
initlength=default
connection=serial
use_locking=yes
serial_baudrate=115200
smsc_timeout=10

[xgnokii]
allow_breakage=0

[gnokiid]
bindir=/usr/sbin/

[connect_script]
TELEPHONE=12345678

[disconnect_script]

[logging]
debug=off
rlpdebug=off
xdebug=off

[fake_driver]
sms_inbox=/tmp/sms
```

## 调试设备

### 识别设备

```shell
root@dev6:~# gnokii --identify
GNOKII Version 0.6.29
IMEI         : 353805016062866
Manufacturer : WAVECOM MODEM
Model        : MULTIBAND  900E  1800
Product name : MULTIBAND  900E  1800
Revision     : 657f00gg.Q24PL002 1
```

### 发送短信

```shell
echo "test message" | gnokii --sendsms {phone number}
```