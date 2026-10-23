# Zencode theme preview

A paragraph with **bold**, *italic*, ~~strike~~, ==highlight==, `inline code`, a [[wiki link]], an [external link](https://obsidian.md), a #tag and <kbd>⌘</kbd> + <kbd>K</kbd>.

## Headings

### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

## Lists

- Item one
- Item two
  - Nested item
1. First
2. Second
- [ ] Todo
- [x] Done

## Quote and rule

> Simplicity is prerequisite for reliability.
> — Edsger W. Dijkstra

---

## Callouts

> [!note]
> Useful information that users should know.

> [!tip]
> Helpful advice for doing things better.

> [!important]
> Key information users need to know.

> [!warning]
> Urgent info that needs immediate attention.

> [!caution]
> Advises about risks or negative outcomes.

## Table

| Language   | Typing  | Paradigm        |
| ---------- | ------- | --------------- |
| TypeScript | Static  | Multi-paradigm  |
| Python     | Dynamic | Multi-paradigm  |
| Rust       | Static  | Systems         |
| Go         | Static  | Concurrent      |

## Code

```ts
// Fetch a user and cache the result
import { cache } from "./cache";

interface User {
  id: number;
  name: string;
  admin?: boolean;
}

export async function getUser(id: number): Promise<User | null> {
  const key = `user:${id}`;
  if (cache.has(key)) return cache.get(key) as User;

  const res = await fetch(`/api/users/${id}`);
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  const user: User = await res.json();
  cache.set(key, user);
  return user;
}
```

```python
from dataclasses import dataclass
import re

@dataclass
class Token:
    kind: str
    value: str

PATTERN = re.compile(r"\d+|[a-z_]\w*", re.I)

def tokenize(src: str) -> list[Token]:
    """Split source text into tokens."""
    out = []
    for m in PATTERN.finditer(src):
        kind = "num" if m.group().isdigit() else "ident"
        out.append(Token(kind, m.group()))
    return out  # TODO: handle operators
```

```rust
use std::collections::HashMap;

#[derive(Debug, Clone)]
struct Counter<'a> {
    words: HashMap<&'a str, usize>,
}

impl<'a> Counter<'a> {
    fn new(text: &'a str) -> Self {
        let mut words = HashMap::new();
        for w in text.split_whitespace() {
            *words.entry(w).or_insert(0) += 1;
        }
        Self { words }
    }
}
```

```go
package main

import "fmt"

func main() {
	ch := make(chan int, 3)
	for i := 0; i < 3; i++ {
		go func(n int) { ch <- n * n }(i)
	}
	fmt.Println(<-ch, <-ch, <-ch)
}
```

```html
<!-- A small card -->
<div class="card" data-id="42">
  <h2>Title</h2>
  <p>Some <strong>text</strong>.</p>
</div>
```

```css
.card:hover {
  color: #0969da;
  transform: translateY(-2px);
}
```

```json
{ "name": "Zen", "version": "0.1.0", "dark": true, "count": 3 }
```

```bash
#!/usr/bin/env bash
for f in *.md; do
  echo "Processing $f"
done
```

```diff
- const color = "purple";
+ const color = "blue";
```

```sql
SELECT id, name FROM users WHERE created_at > '2026-01-01' ORDER BY name LIMIT 10;
```

Footnote reference[^1].

[^1]: The footnote text.
