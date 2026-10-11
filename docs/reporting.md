# Reporting

The four pytest projects include `allure-pytest`. Make test targets write results to each project's `allure-results/` directory.

After running tests, install the Allure CLI and run `make report`. The script generates `site/reports/<project>/index.html` for available result directories. Serve the reports with `python3 -m http.server 8000 --directory site` and open the project report URL.

Local results accumulate between runs. Delete old `allure-results/` directories before a fresh run to avoid mixing results. `make clean` also removes environments and generated reports.

The Pages workflow creates a portal and reports from a successful run. It does not restore Allure history, add custom failure categories, or capture Playwright screenshots/traces. CI artifacts are available for failed test runs; Pages remains at the last successful publication.
