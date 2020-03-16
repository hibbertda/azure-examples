<#
.NOTES
    Daniel Hibbert - March 2020
    Version 0.1

    Microsoft Azure - create-snapshotMD.ps1

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
    KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
    IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
    PARTICULAR PURPOSE.

.DESCRIPTION

       This script will automate the process of creating a snapshot of a managed data disk
       attached to a Source VM, and created and attach a new managed disk on the target vm(s) 

       If a data disk exists on the target VM with the same LUN assisgment as the source the
       existing data disk will be detached and replaced with the new data disk. 

.PARAMETER sourceVM

       Source VM for creating managed disk snapshot

.PARAMETER targetVMs

       [array]List of VMs to attach the new disk(s)

.EXAMPLE
       
       create-snashotMD.ps1 -sourceVM VM01 -targetVMs VM02
       
       Data disk will be copied from VM01 to VM02
#>

[CmdletBinding()]
param (
    [Parameter()]
    [int]$diskSize = 128,                     # Snapshot disk size
    [string]$Sku = "Standard_LRS",
    [string]$sourceVm = "vm-testvm-0",                      # Virtual Machine Name
    [array]$targetVms = @("vm-testvm-1"),
    [string]$snapshotName,
    [string]$primaryRegion = "CentralUS",
    [string]$snapshotRG = "hbl-t-mdShapshots",
    [int]$LUN = 0
)

Clear-Host

# Global Variables
$vmConfig = Get-AzVM -Name $sourceVm
$createdSnapshots = @()
$configVar = New-Object psobject -Property @{
    sourceVM = $vmConfig.Name
    disks = $vmConfig.StorageProfile.DataDisks
    targetDataDisk = ""
}

# Check for multipule data disks on source VM
if ($configVar.disks.count -gt 1){

    # Generate menu to select data disk for snapshot
    write-host -ForegroundColor yellow "`nFound multiple data disks.`n"
    [int]$listitr =1
    $configVar.disks | ForEach-Object {
        write-host "[$listitr] - "$_.name
        $listitr++
    }
    [int]$mdResponse = $(Read-Host -Prompt "Select data disk")-1
    $configVar.targetDataDisk = $configVar.disks[$mdResponse]
}

clear-host

##Create_data_disk_snapshot
$configVar.targetDataDisk | ForEach-Object {
    # Create Snapshot Configuration

    $mdSnapshotName = $_.name + "-snap-" + $(get-date -Format MMddyyyy-mmhhss)
    $mdCondfig = Get-AzDisk -Name $_.Name

    $mdSnapshot = New-AzSnapshotConfig `
        -SourceUri $mdCondfig.Id `
        -location $primaryRegion `
        -createOption copy 

    # Create Data Disk Snapshot
    try {

        write-host -ForegroundColor green -NoNewline "[Step 1] - Creating Data Disk Snapshot"

        $createdSnapshots += (
        New-AzSnapshot -Snapshot $mdSnapshot `
            -SnapshotName $mdSnapshotName `
            -ResourceGroupName $snapshotRG
        )
        write-host -ForegroundColor Yellow "...Completed!"
        write-host -ForegroundColor green "`tSnapshot Name: $mdSnapshotName`n"
    }
    catch {
        Write-Host -ForegroundColor red "...Failed!!!`n"    
        write-host -ForegroundColor red $_
    }
}

## Create new managed disk from snapshot
$targetVms | ForEach-Object {

    $targetVm = get-azVm -Name $_

    write-host -ForegroundColor green -NoNewline "[Step 2] - Creating Managed Disk from Snapshot"

    # Create managed disk from snapshot (one for each target VM)
    $createdSnapshots | foreach-object {
        $mdConfig = New-AzDiskConfig `
            -SkuName $Sku `
            -Location $_.Location `
            -CreateOption Copy `
            -SourceResourceId $_.Id
        $newMD = New-AzDisk `
            -Disk $mdConfig `
            -ResourceGroupName $targetVm.ResourceGroupName `
            -DiskName $_.Name
    }
    write-host -ForegroundColor Yellow "...Completed!"
    write-host -Foregroundcolor green "`tDisk Name: $_.Name`n"

## STEP 3: Attach data disk to target VM

    write-host -ForegroundColor green -NoNewline "[Step 3] - Attach data disk"

    # Check for exiting data disk connected to desired LUN
    foreach ($disk in $($targetVm.StorageProfile.DataDisks)) {
        # If exists detach data disk
        if ($disk.lun -eq $LUN){

            write-host -foregroundColor Yellow "`n`t!! Found existing disk at LUN $LUN !!"

            Remove-AzVMDataDisk -VM $targetVm -Name $disk.name
            update-AzVM -ResourceGroupName $targetVm.ResourceGroupname -VM $targetVM | out-null
        }
    }
    # attach snapshot disk to target VM
    Add-AzVMDataDisk `
        -vm $targetVm `
        -CreateOption attach `
        -Lun $LUN `
        -ManagedDiskId $newMD.Id
    
    Update-AzVm `
        -vm $targetVm `
        -ResourceGroupName $targetVm.ResourceGroupName | out-null

        write-host -ForegroundColor Yellow "...Completed!"


}