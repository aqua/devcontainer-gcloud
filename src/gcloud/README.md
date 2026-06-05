
# Google Cloud CLI (gcloud)

Installs the Google Cloud CLI (gcloud) for managing Google Cloud resources or using local emulators & SDKs.

## Example Usage

```json
"features": {
    "ghcr.io/aqua/devcontainer-gcloud/gcloud:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Version of gcloud to install (e.g. 450.0.0) | string | latest |
| datastore_emulator | If true, also install the Datastore emulator | boolean | false |
| firestore_emulator | If true, also install the Firestore emulator | boolean | false |
| bigtable_emulator | If true, also install the Bigtable emulator | boolean | false |
| pubsub_emulator | If true, also install the Pubsub emulator | boolean | false |
| appengine_go | If true, also install the App Engine Go SDK | boolean | false |
| appengine_java | If true, also install the App Engine Java SDK | boolean | false |
| appengine_python | If true, also install the App Engine Python SDK | boolean | false |

# Container Size Warning

Some of the optional gcloud CLI components this feature can install are quite
large, particularly the emulators, which have sizeable dependencies of their
own.  If you encounter disk space errors building your container, you may
need to increase your Docker disk resource limits.


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/aqua/devcontainer-gcloud/blob/main/src/gcloud/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
