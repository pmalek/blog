---
date: 2024-12-08
title: The hidden gem in Bitwarden's Secret manager - `bws run`
description: In this post we'll discuss how `bws run` can be used to run commands with projects scoped set of secrets via Bitwarden's Secret manager

tags:
- security
- bitwarden

categories:
- Security

---

Password and secret managers are ubiquitous these days and I feel like every one uses them these days (right?).
Which is good, because they help us keep our secrets safe and secure.

I've been using [Bitwarden Password manager][bitwarden_password_manager] personally
for a couple of years now and I've been loving it.
It's [open source][bitwarden_github], has a great community and has many features
that I love (even in the free plan).

Recently, I've started to experiment with their [Secrets manager CLI][bitwarden_secrets_manager_cli] -
`bws` - and one feature that struck me was the `bws run` command.

## `bws run`

In a nutshell, [`bws run`][bws_run] allows you to run a command with secrests injected as environment variables.
That's pretty neat.

What's even cooler is that you can scope the secrets to a project and run commands with that project's secrets.
Let me show you how it works.

[bitwarden_github]: https://github.com/bitwarden
[bitwarden_password_manager]: https://bitwarden.com/products/personal/
[bitwarden_secrets_manager_cli]: https://bitwarden.com/help/secrets-manager-cli/
[bws_run]: https://bitwarden.com/help/secrets-manager-cli/#run

## Project

First, you'd need to create a project in Bitwarden's Secrets manager.

<!-- ref: https://github.com/Fastbyte01/KeepIt/blob/176864f9cd3c101d1a83347ea7e1b0eb009cea39/content/posts/theme-documentation-extended-shortcodes/index.en.md#L128-L194 -->
{{< image src="projects.png" caption="Projects view" >}}

## Secrets

When you have the project in place, populate it with secrets.

{{< image src="project.png" caption="Secrets view" >}}

## Machine account

In order to be able to use `bws` commands, you'll need to create a machine account.

{{< image src="machine_accounts.png" caption="Machine accounts view" >}}

Machine account can be added to multiple projects so that it has access to their secrets.
I'll only add read access to the `test` project but feel free to add more.

{{< image src="test_machine.png" caption="Machine account view" >}}

With that in place we can create the token for our machine account.
Be sure to save it somewhere safe as it won't be shown again.

`bws` will automatically use the token saved in `BWS_ACCOUNT_TOKEN` environment variable so you may want to use that for convenience.

## Running commands

With all that in place we can run our commands and have access to secrets exported as environment variables.

```bash
$ bws run --no-inherit-env env | grep -v "^PATH="
SECRET_NR_2=mysecret
SECRET_NR_1=password
PWD=/private/tmp
SHLVL=1
_=/usr/bin/env
```

You can also constrain the secrets to a particular project by using the [`--project-id`][bitwarden_project_id] flag.

[bitwarden_project_id]: https://bitwarden.com/help/secrets-manager-cli/#run-project-id

```bash
bws run --project-id c8841d6c-4e49-42dc-a79b-b24001110aaf --no-inherit-env env
```

To limit the amount of variables provided to the command, we can also use [`--no-inherit-env`][bitwarden_no_inherit_env] flag.
which will prevent the command from inheriting the environment variables from the current shell.

[bitwarden_no_inherit_env]: https://bitwarden.com/help/secrets-manager-cli/#run-no-inherit-env
