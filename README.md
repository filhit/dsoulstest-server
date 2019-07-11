# dsoulstest-server

Run `install.sh` by `filhit` user.

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
