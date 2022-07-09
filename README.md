# isitdry

A crowd-sourced website to determine if it's dry enough to climb.

## Getting Started

Install locally and run tests:

```bash
make install

make test
```

To run the API:

```bash
make run
```

## Deployment

Hosting is done via [fly.io](https://fly.io/docs/getting-started/installing-flyctl/). Deploy by:

```bash
# Omit the flag to build using your local docker engine
flyctl deploy --remote-only

# Open the app in your browser
flyctl open
```
