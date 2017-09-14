
# Smoke Tests

The tests in this location are Smoke tests. This means that they:

* **TEST:** the expected behaviour of a useable 'feature' of the **deployed** app

* **CONTEXT:** are driven from the browser context (we're assuming for now, that this app is used via a browser)

* **PASS-THROUGH:** all layers of the application

* **MOCK:** NOTHING (this is the real deal, we even call external services)

## How to run

```
$ SMOKE_TEST_HOST=<production host> bundle exec rspec spec_smoke
```
