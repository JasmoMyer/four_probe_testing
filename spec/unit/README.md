
# Unit Tests

The tests in this location are Unit tests. This means that they:

* **TEST:** the expected behaviour of a 'unit' of code (for example, a method)

* **ARE DRIVEN FROM:** the parent context of the unit-under-test (for example, the class / module that houses the method-under-test)

* **PASS THROUGH:** a single component of the app (for example, the class / module that houses the method-under-test)

* **MOCK:** all dependencies (i.e. any resource that the method-under-test depends on)

## How to run

```
$ bundle exec rspec
```
