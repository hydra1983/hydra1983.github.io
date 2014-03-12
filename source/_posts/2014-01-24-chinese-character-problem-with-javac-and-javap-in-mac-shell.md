---
title: "Chinese Character Problem with 'javac' and 'javap' in Mac Shell"
date: 2014-01-24 19:31:14
category: "my tech"
tags: [chinese, utf8, shell, javac, javap, osx, bash]
---

To learn the class initialization process of java, I get [this](http://blog.csdn.net/biaobiaoqi/article/details/11910241) article from google. However, when I write the code to a local file and compile it with **javac**, I get some encoding problem with the output. The same problem happens when I run **javap** as well.

I can find the solution [here](http://stackoverflow.com/questions/361975/setting-the-default-java-character-encoding/623036#623036) and [here](http://stackoverflow.com/questions/361975/setting-the-default-java-character-encoding/623036#623036). This is what I adopt: 
 
```bash
JAVA_OPTS="${JAVA_OPTS} -Dfile.encoding=UTF-8"
# JAVA_OPTS="${JAVA_OPTS} -Dclient.encoding.override=UTF-8"
export JAVA_OPTS

JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} -Dfile.encoding=UTF-8"
export JAVA_TOOL_OPTIONS
```