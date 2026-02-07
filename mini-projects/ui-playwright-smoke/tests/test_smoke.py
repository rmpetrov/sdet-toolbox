def test_homepage_title(page):
    page.set_content(
        """
        <html>
          <head><title>SDET Toolbox Portal</title></head>
          <body>
            <h1>QA Automation Starter</h1>
          </body>
        </html>
        """
    )
    assert page.title() == "SDET Toolbox Portal"


def test_primary_cta_visible(page):
    page.set_content(
        """
        <html>
          <head><title>Landing</title></head>
          <body>
            <a id="primary-cta" href="/docs">Open Playbook</a>
          </body>
        </html>
        """
    )
    cta = page.locator("#primary-cta")
    assert cta.is_visible()
    assert cta.get_attribute("href") == "/docs"
