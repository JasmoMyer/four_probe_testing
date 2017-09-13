
# Integration Tests

The tests in this location are Integration tests. This means that they:

* **TEST:** the expected behaviour of multiple interfacing components within the app (for example, that two classes play nicely together)

* **CONTEXT:** are driven from the context of the components under test

* **PASS-THROUGH:** multiple layers of the application, but not the whole app

* **MOCK:** all dependencies that the components under test require

## How to run

* to run *only* Integration tests:

```
$ bundle exec rspec --tag type:integration
```

* to run Unit, Integration *and* Feature tests:

```
$ bundle exec rspec
```

* Note that Smoke tests are run separately (see smoke_spec/README.md)
