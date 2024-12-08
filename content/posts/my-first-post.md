---
date: 2024-11-29
title: My First Post 👋
description: Let's discuss generics in Golang shall we
# summary: axd

draft: true

tags:
- go
- programming

categories:
- Golang

---

# How to do this

To showcase this, I wrote a quick Benchmark:

```go { title = "hello.go" }
import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/cloudflare/cloudflare-go"
)

func GetEnv(name string) string {
	env := os.Getenv(name)
	if env == "" {
		log.Fatalf("Missing %s environment variable", name)
	}
	return env
}

func main() {
	ctx := context.Background()

	api, err := cloudflare.NewWithAPIToken(GetEnv("CF_API_TOKEN"))
	if err != nil {
		log.Fatal(err)
	}

	zoneID := GetEnv("CF_ZONE_ID")
	token, err := CreateToken(ctx, api, zoneID)
	if err != nil {
		log.Fatal(err)
	}

	apiZone, err := cloudflare.NewWithAPIToken(token.Value)
	if err != nil {
		log.Fatal(err)
	}

	// ...
}
```

"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC

"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
