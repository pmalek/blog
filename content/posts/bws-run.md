---
date: 2024-12-08
title: The hidden gem in Bitwarden's Secret manager - `bws run`
description: In this post we discuss how `bws run` can be used to run commands with projects scoped set of secrets via Bitwarden's Secret manager

draft: true

tags:
- security
- bitwarden

categories:
- Security

---

In this post we discuss how `bws run` can be used to run commands with projects scoped set of secrets via Bitwarden's Secret manager

To showcase this, I wrote a quick Benchmark:

## stuff23

To showcase this, I wrote a quick Benchmark:

```make
.PHONY: _run
_run:
	ANSIBLE_FORCE_COLOR=true \
		ansible-playbook -vvv -i $(INVENTORY) $(PLAYBOOK)

.PHONY: run
run:
	bws run --project-id $(BWS_PROJECT_ID) --no-inherit-env -- \
		$(MAKE) _run PLAYBOOK=test.yaml
```

### stuff23 asd

To showcase this, I wrote a quick Benchmark:

#### stuff23 asdasd
