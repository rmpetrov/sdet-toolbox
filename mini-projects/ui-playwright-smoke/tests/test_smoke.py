import re


def test_homepage_title(page):
    page.goto("https://example.com")
    expect_title = re.compile(r"Example Domain")
    assert expect_title.search(page.title())


def test_primary_cta_visible(page):
    page.goto("https://example.com")
    assert page.locator("text=More information").is_visible()
