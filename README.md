# dsoulstest-server

Create a `filhit` user.
Clone repo to `/home/filhit/dsoulstest-server`
Run `install.sh`.

# ImageMagick policies

```
<policy domain="resource" name="memory" value="2GiB"/>
<policy domain="resource" name="map" value="4GiB"/>
<policy domain="resource" name="width" value="64KP"/>
<policy domain="resource" name="height" value="64KP"/>
<policy domain="resource" name="area" value="100MP"/>
<policy domain="resource" name="disk" value="2GiB"/>
```

# AWS permissions

Backing up requires the following permission policies:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:AbortMultipartUpload"
            ],
            "Resource": "arn:aws:s3:::dsoulstest-server-backups/*"
        }
    ]
}
```
# Azure permissions

Updating maps requires SAS token for https://mineteststorageaccount.blob.core.windows.net/\$web/.

Put the token to /home/filhit/sas.txt
