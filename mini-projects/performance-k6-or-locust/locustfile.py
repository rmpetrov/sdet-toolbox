import csv

from locust import HttpUser, between, events, task
from locust.stats import PERCENTILES_TO_REPORT, StatsCSV


class BasicUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def homepage(self):
        self.client.get("/")


@events.quitting.add_listener
def write_final_csv(environment, **kwargs):
    # The periodic CSV writer can lag behind the final requests in a short run.
    csv_prefix = environment.parsed_options.csv_prefix
    if csv_prefix:
        with open(f"{csv_prefix}_stats.csv", "w", newline="") as stream:
            StatsCSV(environment, PERCENTILES_TO_REPORT).requests_csv(csv.writer(stream))
