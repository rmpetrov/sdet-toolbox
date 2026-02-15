# Contributing

## Install
```bash
python3 -m venv .venv
make setup
```

## Run checks locally
```bash
make lint
make test
```

## View reports
1. Run tests (`make test` or target-specific test commands).
2. Generate reports (`make report`).
3. Open `site/reports/<project>/index.html`.

## Branch and PR style
- Branches: short, descriptive, kebab-case (for example `fix/api-timeout-assertion`).
- Commits: focused and atomic; one logical change per commit.
- Pull requests: include context, testing evidence (commands/output), and linked issue when applicable.
