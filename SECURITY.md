# Security & anonymization policy

This is a personal fork of [gstack](https://github.com/garrytan/gstack). Two guards run on every
push and pull request, and locally on every commit once installed:

1. **Secret scanning** — gitleaks (default ruleset) + trufflehog (verified secrets only). Standard
   credential/token/key detection.
2. **PII / local-machine-path scanning** — a custom, pattern-based ruleset
   (`.gitleaks-pii.toml`) that blocks absolute home-directory paths (Unix and Windows), email
   addresses, private SSH key path references, and private git remote URLs from ever landing in
   tracked content. The rules match the *shape* of a local-machine identifier, not any specific
   person's — this repo has no hardcoded usernames, hostnames, or paths baked into the guard
   itself, so it works the same way regardless of who's running it.

Both checks are enforced in CI (`.github/workflows/security-guards.yml`, required to pass before
merge) and available locally:

```bash
./scripts/install-hooks.sh   # one-time setup, wires scripts/hooks/pre-commit into git
```

## Why this exists

Skill templates, generator config, and docs in this repo should never need a real absolute path,
username, or hostname to make their point — a placeholder (`~/.config/<tool>/skills`, not a
resolved path) works just as well and keeps the repo genuinely portable across machines, which is
also a project goal independent of privacy. If a rule here produces a false positive on
legitimate, non-identifying content, extend the allowlist in `.gitleaks-pii.toml` with a scoped
regex rather than disabling the rule.

## Reporting a problem

If you find a real secret or personal identifier that slipped through, open an issue (or, for
anything sensitive, avoid pasting the finding itself into a public issue — describe the location
and let it be fixed privately).
