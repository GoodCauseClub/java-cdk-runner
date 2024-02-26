# java-cdk-runner
This repository contains a [Docker](https://www.docker.com/) image designed to be used as a
container within [GitHub Actions](https://github.com/features/actions) for building and deploying
Maven-based Java projects and deploying them to [AWS](https://aws.amazon.com/) using the
[AWS Cloud Development Kit](https://aws.amazon.com/cdk/).

## Continuous Integration
Any commit to the `main` branch will trigger a GitHub Action. The action that runs will release a
new version, overwriting the previous one.
