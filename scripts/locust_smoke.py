from locust import HttpUser, between, task


class BasicUser(HttpUser):
    wait_time = between(1, 2)

    @task
    def homepage(self):
        self.client.get("/")
