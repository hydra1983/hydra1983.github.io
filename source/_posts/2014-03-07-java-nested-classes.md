---
title: Nested Classes in Java —— 不再混乱 （一）
date: 2014-03-07 14:46:31
category: "my tech"
tags: [java,嵌套类,内部类]
---

关于 Java 的嵌套类和内部类，网上的说法多种多样。嵌套类、嵌入类、内嵌类、内部类、局部内部类、成员内部类、匿名内部类、静态内部类、静态嵌套类……仔细阅读 [Oracle 的文档](http://docs.oracle.com/javase/tutorial/java/javaOO/nested.html)后，终于对其有了一个清晰的概念。

<!--more-->

> The Java programming language allows you to define a class within another class. Such a class is called a **nested class**...

将 **Nested Class** 翻译为 **嵌套类** 感觉还是挺合适的。上面的英文说明了嵌套类的定义：

> 在另一个类中定义的类，称其为 **嵌套类**。

根据文档，嵌套类又可分为 **静态嵌套类** 和 **非静态嵌套类**。定义为 **static** 的嵌套类称之为 **静态嵌套类**，非 **static** 的嵌套类称之为 **内部类**：

```java
class OuterClass {
    ...
    // 静态嵌套类 (static nested class)
    static class StaticNestedClass {
        ...
    }
    
    // 内部类 (inner class)
    class InnerClass {
        ...
    }
}
```

内部类又有两种特殊形式，**局部类** 和 **匿名类**：

```java
class OuterClass {
    interface Stranger{
        void sayHello();
    }
    
    public static void func1(){
        ...
        // 局部类 (local class)
        class LocalClass {
            ...
        }
        ...
        
        // 匿名类 (anonymous class)
        Stranger s = new Stranger(){
            public void sayHello(){
                ...
            }
        }
        
        s.sayHello();
        ...
    }
}
```


