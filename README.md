# Pandell Dockerfiles &amp; Examples

This repository contains Dockerfiles and example configurations for running Pandell applications in development environments.

## Goals

-   Try to replicate a production-ish environment to run applications
-   Support default [container isolation mode](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-containers/hyperv-container) for whichever host OS is being used
    -   Default isolation mode on Windows 10 is HyperV Isolation
    -   Default isolation mode on Windows Server 2019 is Process Isolation
    -   Therefore, containers targeting Windows Server 2019 should work by default on both host OSes
-   Support using Windows Server 2019 (without GUI) as a host-in-a-VM for non-Windows workstations
    -   With (default) process isolation mode, nested virtualization is not required
    -   Can use `docker-machine env` to connect to Docker host on VM

## Dockerfiles

### `aspnet-framework`

-   Windows Server 2019
-   IIS 10 with .NET Framework 4.8
-   URL Rewrite Module
-   Authentication sections in `ApplicationHost.config` unlocked
-   Debug utilities

### `mssql-windows`

Forked from [mssql-docker](https://github.com/microsoft/mssql-docker/blob/e4afa866646c25decef32f8946a995074c3251e7/windows/mssql-server-windows-express/dockerfile) to support Windows Server 2019.

-   Windows Server 2019
-   SQL Server Express 2017

## Samples

### `pli`

-   Shows an example using `docker-compose` that launches an application server and a database
-   Code is compiled on the developer workstation
-   Data directories and compilation output folders are mounted as volumes inside the containers
    -   For databases, allows persistence between container runs
    -   For application, allows for the familiar rebuild+refresh development flow
-   Some initial setup is required for restoring a database, but could be automated
