## Env vars to setup in circleci project
```
AWS_DEFAULT_REGION
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

SLACK_ACCESS_TOKEN
SLACK_DEFAULT_CHANNEL
```
Note: The AWS Key and Secret should be setup in console. This is not the default Udacity generated temp id.


Each project need the ssh key used added to the additional ssh keys in CircleCI.

And then use the generated fingerprint to configure in the config file.
      - add_ssh_keys:
          fingerprints: ["4b:34:8a:72:f8:b0:bf:9d:c7:fc:6a:0a:27:8a:c1:92"]

