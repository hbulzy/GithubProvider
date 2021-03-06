﻿@{

# Script module or binary module file associated with this manifest.
RootModule = 'GithubFS.psm1'

# Version number of this module.
ModuleVersion = if ($env:APPVEYOR_REPO_TAG_NAME -ne $null) { $env:APPVEYOR_REPO_TAG_NAME } else { "0.0.0" }

# ID used to uniquely identify this module
GUID = 'bd4390dc-a8ad-4bce-8d69-f53ccf8e4163'

# Author of this module
Author = 'Wesley Wigham <wwigham@gmail.com>'

# Company or vendor of this module
CompanyName = ''

# Copyright statement for this module
Copyright = '(c) 2015 . All rights reserved.'

# Description of the functionality provided by this module
Description = @'
# GithubFS
A provider for powershell which uses octokit to let you use github repos as a filesystem inside powershell

##Usage
Install the `GithubFS` PSModule to a modules directory of your choice, then import it in your profile with
```powershell
ipmo GithubFS
```
Additionally, visit github and grab a [personal access token](https://github.com/settings/tokens). (You should 
probably give it user and repo permissions) Drop that in your profile like so:
```powershell
$env:GITHUB_TOKEN = '<token>';
```
Great! Now once you refresh your shell you should have access to a `GH:` drive which contains all the orgs/users you
know about! You should be able to use it just like it was a filesystem, however not all applications are capable
of using PSProviders for input paths.

##Detail
The `GithubProvider` project contains a few C# classes used to bind the Github API to a PSProvider and register
the provider.
The `GithubFS` project is a powershell module which loads the `GithubProvider` and, additionally, provides a few
useful cmdlets for manipulating and using the github psprovider. 

###Provided Cmdlets
####Out-Github
Is a proxy to `Out-File` which knows about the Github PSProvider and polyfills support for it using `set-content`
to recreate the unavailable stream support. It is aliased to override `Out-File` so that it polyfills support for 
shell redirections.

'@

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @("bin/Octokit.dll", "bin/Octokit.Caching.dll")

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @("pathinfo.format.ps1xml")

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @("bin/GithubProvider.dll")

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('git', 'github', 'psprovider', 'provider', 'filesystem', 'version', 'control')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/weswigham/GithubProvider/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/weswigham/GithubProvider'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://github.com/weswigham/GithubProvider/blob/master/README.md'

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

