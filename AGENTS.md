# Book Collection development instructions

## Running tests

Ruby is installed through rbenv, but it is not automatically available to
non-interactive shells. Before invoking Bundler or Rails, initialize rbenv:

```bash
eval "$(/home/ubuntu/.rbenv/bin/rbenv init - --no-rehash bash)"
```

Then run the test suites:

```bash
bundle exec rails test
bundle exec rails test:system
```

The PostgreSQL instance is reachable from the host environment, but not from
the default sandbox network namespace. Agents must run these commands with
host-network / escalated access enabled; otherwise Rails will fail to connect
to PostgreSQL at `localhost:5432`.

System tests use Selenium with Google Chrome. Confirm Chrome is installed with:

```bash
google-chrome --version
```
