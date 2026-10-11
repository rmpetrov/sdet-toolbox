# CI/CD pipeline

`ci.yml` runs Ruff lint/format checks and four pytest suites on pushes and pull requests to main. API, contract, and data suites use a matrix; UI uses Chromium with Linux system dependencies. Each project installs its own pinned direct dependencies on Python 3.11.

Allure result directories are uploaded even if tests fail. Screenshots, traces, failure grouping, and trend tracking are not configured. Locust runs only through the local performance target.

`pages-report.yml` reruns all four suites on pushes to main or manual dispatch. After successful tests, it installs Allure 2.24.1, generates four reports and a portal, and deploys to GitHub Pages. A failed suite prevents publication, so the portal can show an older successful commit.

Repository Pages settings must use GitHub Actions as the source. Build jobs have read-only repository permissions; only the deploy job receives Pages and OIDC write permissions. Branch protection and required checks are repository settings, not supplied by these files.
