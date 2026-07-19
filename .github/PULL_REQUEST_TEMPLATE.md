## What

<!-- What does this change do, in a sentence or two? -->

## Why

<!-- What problem does this solve, or what does it enable? Link an issue if there is one. -->

## Checklist

- [ ] Every commit has a `Signed-off-by:` trailer (`git commit -s`) — see [CONTRIBUTING.md](../CONTRIBUTING.md#developer-certificate-of-origin-dco)
- [ ] `bun test` passes
- [ ] `bun run test:evals` passes (or `CHANGELOG_SKIP=1` is set for non-user-facing changes)
- [ ] A `changelog.d/<name>.<type>.md` fragment is added for any user-facing change (or `CHANGELOG_SKIP=1` is set for non-user-facing changes)
