
# Feature Tests

The tests in this location are Feature tests. This means that they:

* **TEST:** the expected behaviour of a useable 'feature' of the app

* **CONTEXT:** are driven from the browser context (we're assuming for now, that this app is used via a browser)

* **PASS-THROUGH:** all layers of the application

* **MOCK:** all *external* dependencies (i.e. any external services that the feature-under-test depends upon). However no components *within* the app are mocked.

## How to run

* to run *only* Feature tests:

```
$ bundle exec rspec --tag type:feature
```

* to run Unit, Integration *and* Feature tests:

```
$ bundle exec rspec
```

* Note that Smoke tests are run separately (see smoke_spec/README.md)
