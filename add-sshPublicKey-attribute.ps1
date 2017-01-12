Function New-AttributeID {

    $Prefix="1.2.840.113556.1.8000.2554"

    $GUID=[System.Guid]::NewGuid().ToString()

    $Parts=@()

    $Parts+=[UInt64]::Parse($guid.SubString(0,4),"AllowHexSpecifier")

    $Parts+=[UInt64]::Parse($guid.SubString(4,4),"AllowHexSpecifier")

    $Parts+=[UInt64]::Parse($guid.SubString(9,4),"AllowHexSpecifier")

    $Parts+=[UInt64]::Parse($guid.SubString(14,4),"AllowHexSpecifier")

    $Parts+=[UInt64]::Parse($guid.SubString(19,4),"AllowHexSpecifier")

    $Parts+=[UInt64]::Parse($guid.SubString(24,6),"AllowHexSpecifier")

    $Parts+=[UInt64]::Parse($guid.SubString(30,6),"AllowHexSpecifier")

    $oid=[String]::Format("{0}.{1}.{2}.{3}.{4}.{5}.{6}.{7}",$prefix,$Parts[0],

                 $Parts[1],$Parts[2],$Parts[3],$Parts[4],$Parts[5],$Parts[6])

        $oid

}

$schemaPath = (Get-ADRootDSE).schemaNamingContext

$oid = New-AttributeID

$attributes = @{

      lDAPDisplayName = 'sshPublicKey';

      attributeId = $oid;

      oMSyntax = 22;

      attributeSyntax = "2.5.5.5";

      isSingleValued = $true;

      adminDescription = 'User Public key for SSH login';

      }

New-ADObject -Name sshPublicKey -Type attributeSchema -Path $schemapath -OtherAttributes $attributes
