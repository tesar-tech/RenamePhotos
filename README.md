# Rename photos

From this: `DSC106.jpg`  To: `20200312_2345.jpg`

Dotnet tool for renaming photos in **date taken** metadata style. Works with .net5.0.

## Install

> dotnet tool install renamephotos -g

[![RenamePhotos](https://img.shields.io/nuget/v/RenamePhotos.svg)](https://www.nuget.org/packages/RenamePhotos/)

## Usage

Use `RenamePhotos` command in folder with `.jpg`  pictures. It will rename them all.

## How to create and publish NuGet package

This is mostly selfnote for me.
When I will be buildingcreating next nuget package I know I will look at here ¯\\_(ツ)_/¯ .

### Create nuget package

- change the package vesion inside `.csproj`: `<PackageVersion>1.0.6</PackageVersion>`
- instal nuget with choco: `choco install nuget.commandline`
- publish project `dotnet publish -c release`
  - this will generate package, because there is `<PackageOutputPath>./nupkg</PackageOutputPath>` and `<GeneratePackageOnBuild>true</GeneratePackageOnBuild>` that will ensure package will be created in `nupkg` folder. In that case `.nuspec` is not needed here.

### Publish

- (easy way) Login to nuget.org and drag the package in there, or:

- generate api key on nuget.org
- store the api key: `nuget setApiKey iamthesecretkey`
- push the package: `nuget push .\nupkg\RenamePhotos.1.0.7.nupkg -Source https://api.nuget.org/v3/index.json`

- More info [here](https://docs.microsoft.com/en-us/nuget/nuget-org/publish-a-package)
- [Properties](https://docs.microsoft.com/en-us/nuget/reference/msbuild-targets#pack-target) for `.nuspec` file and their alternatives in `.csproj`.
