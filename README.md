# Piet Web

This is a small web app based on [piet](http://github.com/thesmartnik/piet)
To run this you need to have processing and ruby installed.

## Instalation

### Install Processing

#### OS X

You can install via homebrew or [direct link](http://download.processing.org/processing-3.3.7-macosx.zip)

#### Linux

* [64-bit](http://download.processing.org/processing-3.3.7-linux64.tgz)
* [32-bit](http://download.processing.org/processing-3.3.7-linux32.tgz)
* [ARM](http://download.processing.org/processing-3.3.7-linux-armv6hf.tgz)

### Create symlink for processing executable
```
sudo ln -s path/to/processing/processing-java /bin/processing-java
```

### Run tests to check that everything works

```
bundle install
bundle exec rspec
```

## Run

### Development

* Start server
```
rackup
```

* Visit http://localhost:9292/cover?title=Book%20Title&author=Book%20Author

## What this awesome web app can do?

* Generate covers on request
* Generate multiple covers from csv file
  - http://localhost:9292/batch
