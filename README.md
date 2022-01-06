# Python Docker Image for DotNet Framework Runtime

This repository contains a Python docker image build script for Windows DotNet Framework Runtime.

[Docker Hub](https://hub.docker.com/repository/docker/deleuzech/python-dotnet)

## How to use

```powershell
docker pull deleuzech/python-dotnet:3.10.1_4.8
docker run -it deleuzech/python-dotnet:3.10.1_4.8
```

## How to build

You can build your DotNet Python image with the below command.

```powershell
$EACH_PYTHON_VERSION='3.10.1'
$EACH_DOTNET_FRAMEWORK_RUNTIME_VERSION='3.5'
$IMAGE_TAG="${EACH_PYTHON_VERSION}_${EACH_DOTNET_FRAMEWORK_RUNTIME_VERSION}"

$TARGET_PYTHON_PIP_VERSION='21.3.1'
$TARGET_PYTHON_GET_PIP_URL='https://github.com/pypa/get-pip/raw/d59197a3c169cef378a22428a3fa99d33e080a5d/get-pip.py'
$TARGET_PYTHON_GET_PIP_SHA256='421ac1d44c0cf9730a088e337867d974b91bdce4ea2636099275071878cc189e'

docker build \
    -t python-dotnet:$IMAGE_TAG \
    --build-arg DOTNET_FRAMEWORK_RUNTIME_VERSION=$EACH_DOTNET_FRAMEWORK_RUNTIME_VERSION \
    --build-arg PYTHON_VERSION=$EACH_PYTHON_VERSION \
    --build-arg PYTHON_RELEASE=$EACH_PYTHON_VERSION \
    --build-arg PYTHON_PIP_VERSION=$TARGET_PYTHON_PIP_VERSION \
    --build-arg PYTHON_GET_PIP_URL=$TARGET_PYTHON_GET_PIP_URL \
    .
```

This image includes pip and virtualenv.

## Contribution

I tested this Docker image for Framework 3.5. If you make a docker image for another version of Framework, please make a pull request with some tests.

### Test Criteria

- The image you built should support the pip tool.
- The image you built should support the virtualenv tool.
- The image you built can install Django via a virtualenv isolated environment.
- The image you built can install AWS CLI, and it does not display .py file association missing error.
- More testing criteria are welcome!