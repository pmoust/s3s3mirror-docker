s3s3mirror Docker executable
============================

[![Join the chat at https://gitter.im/pmoust/s3s3mirror-docker](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pmoust/s3s3mirror-docker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Docker container executable of [s3s3mirror](https://github.com/cobbzilla/s3s3mirror)

### About s3s3mirror

An utility for mirroring content from one S3 bucket to another.

Designed to be lightning-fast and highly concurrent, with modest CPU and memory requirements.

An object will be copied if and only if at least one of the following holds true:

* The object does not exist in the destination bucket.
* The size or ETag of the object in the destination bucket are different from the size/ETag in the source bucket.

When copying, the source metadata and ACL lists are also copied to the destination object.

(original documentation [available here](https://github.com/cobbzilla/s3s3mirror/blob/master/README.md))

### Usage:

```
docker run -e AWS_ACCESS_KEY_ID=FOO -e AWS_SECRET_ACCESS_KEY=BAR pmoust/s3s3mirror [OPTIONS] source_bucket[/prefix] dest_bucket[/prefix]
```

### Options:

```
docker run pmoust/s3s3mirror
```

```
    -c (--ctime) N           : Only copy objects whose Last-Modified date is younger than this many days
                               For other time units, use these suffixes: y (years), M (months), d (days), w (weeks),
                                                                         h (hours), m (minutes), s (seconds)
    -m (--max-connections) N  : Maximum number of connections to S3 (default 100)
    -n (--dry-run)            : Do not actually do anything, but show what would be done (default false)
    -r (--max-retries) N      : Maximum number of retries for S3 requests (default 5)
    -p (--prefix) VAL         : Only copy objects whose keys start with this prefix
    -d (--dest-prefix) VAL    : Destination prefix (replacing the one specified in --prefix, if any)
    -e (--endpoint) VAL       : AWS endpoint to use (or set AWS_ENDPOINT in your environment)
    -X (--delete-removed)     : Delete objects from the destination bucket if they do not exist in the source bucket
    -t (--max-threads) N      : Maximum number of threads (default 100)
    -v (--verbose)            : Verbose output (default false)
    -z (--proxy) VAL          : host:port of proxy server to use.
                                Defaults to proxy_host and proxy_port defined in ~/.s3cfg,
                                or no proxy if these values are not found in ~/.s3cfg
    -u (--upload-part-size) N : The upload size (in bytes) of each part uploaded as part of a multipart request
                                for files that are greater than the max allowed file size of 5368709120 bytes (5 GB)
                                Defaults to 4294967296 bytes (4 GB)
    -C (--cross-account-copy) : Copy across AWS accounts. Only Resource-based policies are supported (as
                                specified by AWS documentation) for cross account copying
                                Default is false (copying within same account, preserving ACLs across copies)
                                If this option is active, the owner of the destination bucket will receive full control
```

### Support s3s3mirror author:

If you've enjoyed using s3s3mirror and are looking for a warm-fuzzy feeling, consider dropping a little somethin' into [tip jar](https://www.gittip.com/cobbzilla)
