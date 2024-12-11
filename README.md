[![Pages deploy](https://github.com/pmalek/blog/actions/workflows/publish.yaml/badge.svg)][gh_publish]

# blog

Source code for personal blog at [blog.pmalek.dev][blog].

## How it's made

- [Hugo][hugo_io] static site generator
- [Forked][keep_it_pmalek] [`KeepIt`][keep_it_upstream] theme
- [Giscus][giscus] for comments using GitHub discussions
- [`mise`][mise] for tools management
- GitHub Actions for CI/CD and [site deployment][gh_publish]

[blog]: https://blog.pmalek.dev
[giscus]: https://giscus.app/
[mise]: https://github.com/jdx/mise
[hugo_io]: https://gohugo.io/
[keep_it_pmalek]: https://github.com/pmalek/KeepIt/
[keep_it_upstream]: https://github.com/Fastbyte01/KeepIt
[gh_publish]: https://github.com/pmalek/blog/actions/workflows/publish.yaml

## How to build

To run locally

```
make run
```

To build the site

```
make build
```
