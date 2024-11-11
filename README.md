# docker2ghcr

This github action will pull the images from docker.io and push it to ghcr.io.

## Usage

Use the image full name to pull the image from docker.io

e.g.

If you want to pull `docker.io/rancher/k3s:v1.27.4-k3s1` for the `linux/arm64`, just take the `rancher/k3s:v1.27.4-k3s1` and `linux/arm64` as input.

After the action finished, you can use the following commands to pull and retag it.

```shell
docker pull ghcr.io/zong-zhe/k3s:v1.27.4-k3s1
docker tag ghcr.io/zong-zhe/k3s:v1.27.4-k3s1 docker.io/rancher/k3s:v1.27.4-k3s1
```
