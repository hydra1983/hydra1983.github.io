title: Trigger Jenkins Build throu Gitlab Webhook when Push
date: 2014-10-13 22:16:17
tags:
---

Just add line below to Gitlab webhooks

```
http://{jenkins}/git/notifyCommit?url={ssh/http/https}://git@{gitlab}/{group}/{project}.git
```