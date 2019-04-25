#!/bin/bash
#invoke from repo root

solution=GLTFSerialization/GLTFSerialization.sln
target=GLTFSerialization
framework=net35

echo restoring dependencies
dotnet restore $solution

echo building solution, target: $target, framework: $framework
dotnet msbuild $solution -t:$target -p:TargetFramework=$framework

echo building unity package
./scripts/export-unity-package.sh

echo please find package in current-package
ls -la current-package
