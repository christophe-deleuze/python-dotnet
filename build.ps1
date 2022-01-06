#!/usr/bin/env pwsh
$TARGET_PYTHON_VERSION=('3.9.9', '3.10.1')
$TARGET_DOTNET_FRAMEWORK_RUNTIME_VERSION=('3.5', '4.6.2', '4.7.2', '4.8')

$TARGET_PYTHON_PIP_VERSION='21.3.1'
$TARGET_PYTHON_GET_PIP_URL='https://github.com/pypa/get-pip/raw/d59197a3c169cef378a22428a3fa99d33e080a5d/get-pip.py'
$TARGET_PYTHON_GET_PIP_SHA256='421ac1d44c0cf9730a088e337867d974b91bdce4ea2636099275071878cc189e'

foreach ($EACH_PYTHON_VERSION in $TARGET_PYTHON_VERSION) {
    foreach ($EACH_DOTNET_FRAMEWORK_RUNTIME_VERSION in $TARGET_DOTNET_FRAMEWORK_RUNTIME_VERSION) {
        $IMAGE_TAG="${EACH_PYTHON_VERSION}_${EACH_DOTNET_FRAMEWORK_RUNTIME_VERSION}"
        docker build `
            -t python-dotnet:$IMAGE_TAG `
            --build-arg DOTNET_FRAMEWORK_RUNTIME_VERSION=$EACH_DOTNET_FRAMEWORK_RUNTIME_VERSION `
            --build-arg PYTHON_VERSION=$EACH_PYTHON_VERSION `
            --build-arg PYTHON_RELEASE=$EACH_PYTHON_VERSION `
            --build-arg PYTHON_PIP_VERSION=$TARGET_PYTHON_PIP_VERSION `
            --build-arg PYTHON_GET_PIP_URL=$TARGET_PYTHON_GET_PIP_URL `
            --build-arg PYTHON_GET_PIP_SHA256=$TARGET_PYTHON_GET_PIP_SHA256 `
            .
        docker tag python-dotnet:$IMAGE_TAG deleuzech/python-dotnet:$IMAGE_TAG
        docker push deleuzech/python-dotnet:$IMAGE_TAG
        docker rmi python-dotnet:$IMAGE_TAG
    }
}

docker container prune
docker image prune
