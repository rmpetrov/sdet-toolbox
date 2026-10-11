# Test strategy

Keep examples small, deterministic, and easy to inspect. The current checks use a local HTTP server, inline HTML, JSON/YAML fixtures, and a sample CSV. They demonstrate assertions and tool integration rather than coverage of a deployed product.

API checks cover two successful responses and one 404. UI checks cover a title and link attributes without navigation. Contract checks validate a specification and a positive fixture; they do not compare versions or call a provider. Data checks validate one positive dataset. The Locust scenario exercises only GET / and is run manually.

When adapting an example, choose assertions for the actual product risk and include representative invalid inputs where useful. Keep network targets and data under your control. Diagnose failures from the smallest relevant Make target before running all suites.

There is no staging environment, merge gate configuration, or full unit-test layer in this repository. See the flaky-test playbook for general debugging advice.
