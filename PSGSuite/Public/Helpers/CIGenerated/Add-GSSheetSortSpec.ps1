function Add-GSSheetSortSpec {
    <#
    .SYNOPSIS
    Creates a Google.Apis.Sheets.v4.Data.SortSpec object.

    .DESCRIPTION
    Creates a Google.Apis.Sheets.v4.Data.SortSpec object.

    .PARAMETER DimensionIndex
    Accepts the following type: [int].

    .PARAMETER SortOrder
    Accepts the following type: [string].

    .EXAMPLE
    Add-GSSheetSortSpec -DimensionIndex $dimensionIndex -SortOrder $sortOrder
    #>
    [OutputType('Google.Apis.Sheets.v4.Data.SortSpec')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [int]
        $DimensionIndex,
        [parameter()]
        [string]
        $SortOrder,
        [parameter(Mandatory = $false,ValueFromPipeline = $true,ParameterSetName = "InputObject")]
        [Google.Apis.Sheets.v4.Data.SortSpec[]]
        $InputObject
    )
    Process {
        try {
            switch ($PSCmdlet.ParameterSetName) {
                Fields {
                    $obj = New-Object 'Google.Apis.Sheets.v4.Data.SortSpec'
                    foreach ($prop in $PSBoundParameters.Keys | Where-Object {$obj.PSObject.Properties.Name -contains $_}) {
                        switch ($prop) {
                            default {
                                $obj.$prop = $PSBoundParameters[$prop]
                            }
                        }
                    }
                    $obj
                }
                InputObject {
                    foreach ($iObj in $InputObject) {
                        $obj = New-Object 'Google.Apis.Sheets.v4.Data.SortSpec'
                        foreach ($prop in $iObj.PSObject.Properties.Name | Where-Object {$obj.PSObject.Properties.Name -contains $_ -and $_ -ne 'ETag'}) {
                            $obj.$prop = $iObj.$prop
                        }
                        $obj
                    }
                }
            }
        }
        catch {
            if ($ErrorActionPreference -eq 'Stop') {
                $PSCmdlet.ThrowTerminatingError($_)
            }
            else {
                Write-Error $_
            }
        }
    }
}