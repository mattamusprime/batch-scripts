$tohash=$args[0]
$verificationHash = $($args[1] -replace " ", "")

Write-Host "Hashing: $tohash"

$md5 = $($(certUtil -hashfile $tohash MD5)[1] -replace " ","")
if( ($verificationHash -eq $md5) -or ($verificationHash -eq "") ){
	if( ($verificationHash -eq $md5) ) {
		Write-Host "  MATCH!"
	}
	Write-Host "    MD5:" $md5
}

$sha1 = $($(certUtil -hashfile $tohash SHA1)[1] -replace " ","")
if( ($verificationHash -eq $sha1) -or ($verificationHash -eq "") ){
	if( ($verificationHash -eq $sha1) ) {
		Write-Host "  MATCH!"
	}
	Write-Host "   SHA1:" $sha1
}

$sha256 = $($(certUtil -hashfile $tohash SHA256)[1] -replace " ","")
if( ($verificationHash -eq $sha256) -or ($verificationHash -eq "") ){
	if( ($verificationHash -eq $sha256) ) {
		Write-Host "  MATCH!"
	}
	Write-Host " SHA256:" $sha256
}

$sha512 = $($(certUtil -hashfile $tohash SHA512)[1] -replace " ","")
if( ($verificationHash -eq $sha512) -or ($verificationHash -eq "") ){
	if( ($verificationHash -eq $sha512) ) {
		Write-Host "  MATCH!"
	}
	Write-Host " SHA512:" $sha512
}	