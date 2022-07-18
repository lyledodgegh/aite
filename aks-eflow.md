# Project Haven: Kubernetes for the embedded edge

## Notes

Start by watching the [Project Haven: Kubernetes for the embedded edge Microsoft Build Session](https://mybuild.microsoft.com/en-US/sessions/d0cb7a1c-3c05-4497-8734-879fbc4fde60?source=sessions).

- [Get a Windows 11 Developer Environment](https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)
- [Install the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

*Configure Nested Virtualization in Hyper-V (for a specific vm) [source](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/nested-virtualization)*

```
Set-VMProcessor -VMName WinDev2206Eval -ExposeVirtualizationExtensions $true
```

*Set PowerShell Execution Policy to Unrestricted*

```
Set-ExecutionPolicy Unrestricted
```
