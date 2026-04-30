#!/usr/bin/env groovy

def call(Map config = [:]) {
    String repoUrl = requireValue(config, 'repoUrl')
    String branch = (config.branch ?: env.BRANCH_NAME ?: 'main').toString()
    String cacheLocation = (config.cacheLocation ?: 'temp').toString().toLowerCase()
    String lockName = (config.lockName ?: 'openintegrations-repo-cache').toString()

    String workspaceDir = pwd()
    String tempDir = pwd(tmp: true)
    String cacheRoot = cacheLocation == 'workspace' ? "${workspaceDir}/.repo-cache" : "${tempDir}/repo-cache"
    String mirrorDir = "${cacheRoot}/mirror.git"
    String lfsDir = "${cacheRoot}/lfs"

    lock(resource: lockName) {
        if (isUnix()) {
            sh """
                set -euo pipefail

                mkdir -p "${cacheRoot}" "${lfsDir}"

                if [ ! -d "${mirrorDir}" ]; then
                    git clone --mirror "${repoUrl}" "${mirrorDir}"
                fi

                git -C "${mirrorDir}" remote update --prune

                rm -rf .git
                git init
                git remote add origin "${repoUrl}"

                mkdir -p .git/objects/info
                printf '%s\\n' "${mirrorDir}/objects" > .git/objects/info/alternates

                git fetch --prune --no-tags origin "${branch}"
                git checkout -B "${branch}" "origin/${branch}"

                git config lfs.storage "${lfsDir}"
                git lfs install --local
                git lfs fetch origin "${branch}"
                git lfs checkout
            """
        } else {
            bat """
                @echo off
                setlocal EnableDelayedExpansion

                if not exist "${cacheRoot}" mkdir "${cacheRoot}"
                if not exist "${lfsDir}" mkdir "${lfsDir}"

                if not exist "${mirrorDir}" (
                    git clone --mirror "${repoUrl}" "${mirrorDir}"
                    if errorlevel 1 exit /b 1
                )

                git -C "${mirrorDir}" remote update --prune
                if errorlevel 1 exit /b 1

                if exist .git rmdir /s /q .git
                git init
                if errorlevel 1 exit /b 1

                git remote add origin "${repoUrl}"
                if errorlevel 1 exit /b 1

                if not exist ".git\\objects\\info" mkdir ".git\\objects\\info"
                > ".git\\objects\\info\\alternates" echo ${mirrorDir}\\objects

                git fetch --prune --no-tags origin "${branch}"
                if errorlevel 1 exit /b 1

                git checkout -B "${branch}" "origin/${branch}"
                if errorlevel 1 exit /b 1

                git config lfs.storage "${lfsDir}"
                if errorlevel 1 exit /b 1

                git lfs install --local
                if errorlevel 1 exit /b 1

                git lfs fetch origin "${branch}"
                if errorlevel 1 exit /b 1

                git lfs checkout
                if errorlevel 1 exit /b 1
            """
        }
    }
}

private String requireValue(Map config, String key) {
    def value = config[key]
    if (value == null || value.toString().trim().isEmpty()) {
        error("prepareOpenIntegrationsRepo: '${key}' is required")
    }
    return value.toString()
}
