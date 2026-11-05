---
name: commit-as-sp
description: Create a git commit with author and committer both set to "sabotenpillow <saboten.pillow@gmail.com>", regardless of the repo's git config. Use when the user runs /commit-as-sp or asks to commit as sabotenpillow / sp.
---

# Commit as sabotenpillow

Create a git commit whose author AND committer are both:

```
sabotenpillow <saboten.pillow@gmail.com>
```

This overrides the local and global git `user.name` / `user.email`.

## Steps

1. Review what will be committed:
   - `git status`
   - `git diff` and `git diff --staged`
   - `git log --oneline -10` to match the repo's message style
2. Stage only the files that belong to this change, by name. Avoid `git add -A` unless the user asks for it. Never stage secrets (`.env`, keys, credentials).
3. Write a commit message that follows the repo's existing convention. If the user supplied a message as an argument, use it.
4. Commit with both identities set explicitly:

   ```bash
   GIT_COMMITTER_NAME="sabotenpillow" \
   GIT_COMMITTER_EMAIL="saboten.pillow@gmail.com" \
   git commit --author="sabotenpillow <saboten.pillow@gmail.com>" -m "$(cat <<'EOF'
   <message>
   EOF
   )"
   ```

5. Verify and report the result:

   ```bash
   git log -1 --format='%h %s%nauthor:    %an <%ae>%ncommitter: %cn <%ce>'
   ```

   If either identity is wrong, fix it with:

   ```bash
   GIT_COMMITTER_NAME="sabotenpillow" GIT_COMMITTER_EMAIL="saboten.pillow@gmail.com" \
     git commit --amend --no-edit --author="sabotenpillow <saboten.pillow@gmail.com>"
   ```

## Rules

- Do not push unless the user asks.
- Do not change git config (local or global) as part of this skill.
- If a pre-commit hook fails, fix the issue and create a new commit. Do not use `--no-verify`.
- If there is nothing to commit, say so and stop.
