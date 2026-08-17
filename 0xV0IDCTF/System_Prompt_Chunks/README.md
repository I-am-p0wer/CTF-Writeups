## [25pt]System_Prompt_Chunks

The model exported a context window but shuffled segment indexes by accident

## Solution

```shell
localhost:~# strings context_chunks.json
  "model": "context-window-exporter-v1",
  "windowing_mode": "overwrite",
  "note": "chunk_index is the original context slot",
  "chunks": [
    {
      "segment_index": 2,
      "payload_b64": "X2J5Xw=="
    },
    {
      "segment_index": 0,
      "payload_b64": "MHhWb2lkew=="
    },
    {
      "segment_index": 3,
      "payload_b64": "Y29udGV4dH0="
    },
    {
      "segment_index": 1,
      "payload_b64": "c29ydGVk"
    }
```

payloadをindex順に並び替えてbase64 decodeする。
練習を兼ねてPythonで書く。

```Python
import base64

text = ["MHhWb2lkew==","c29ydGVk","X2J5Xw==","Y29udGV4dH0="]

plain = ""

for k in text:
	plain += base64.b64decode(k).decode()

print(plain)
```

## Flag
```
0xVoid{sorted_by_context}
```