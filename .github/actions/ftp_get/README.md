# ftp-get

Fetching files from ftpstanis

## Example usage

```
name: Deploy via ftp
on: push
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: get foo
      uses: ./github/actions/ftp_get
      with:
        user: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        localDir: "foo"
        remoteDir: "foo.bar"
```

## Input parameters

Input parameter | Description | Required | Default
--- | --- | --- | ---
user | FTP username | Yes | N/A
password | FTP password | Yes | N/A
local | The local directory to copy | No | .
remote | The remote directory to copy to | No | .
