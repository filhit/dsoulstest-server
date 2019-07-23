# dsoulstest-server

Create a `filhit` user.
Clone repo to `/home/filhit/dsoulstest-server`
Run `install.sh`.

# AWS permissions

Backing up requires the following permission policy:

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
