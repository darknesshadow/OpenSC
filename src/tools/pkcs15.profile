#
# PKCS15 profile, generic information.
# This profile is loaded before any card specific profile.
#

# This is the DIR file
EF PKCS15-DIR
	Path		3F002F00
	Size		128
	ACL		*=NONE

# This is the application DF
DF
	Path		3F005015
	AID		A0:00:00:00:63:50:4B:43:53:2D:31:35
	ACL		*=NONE

EF PKCS15-ODF
	FileID		5031
	Size		256
	ACL		*=NONE

EF PKCS15-TokenInfo
	FileID		5032
	ACL		*=NONE

EF PKCS15-AODF
	FileID		4401
	Size		256
	ACL		*=NEVER READ=NONE UPDATE=CHV2

EF PKCS15-PrKDF
	FileID		4402
	Size		512
	ACL		*=NEVER READ=NONE UPDATE=CHV2

EF PKCS15-PuKDF
	FileID		4403
	Size		512
	ACL		*=NEVER READ=NONE UPDATE=CHV2

EF PKCS15-CDF
	FileID		4404
	Size		512
	ACL		*=NEVER READ=NONE UPDATE=CHV2

# Generic PIN information
PIN CHV1
	Label		"Authentication PIN"
	AuthID		01

PIN CHV2
	Label		"Non-repudiation PIN"
	AuthID		02

PrivateKey AuthKey
	Label		"Authentication Key"
	ID		45
	AuthID		01	# Requires CHV1
	KeyUsage	sign

PrivateKey SignKey
	Label		"Non-repudiation Key"
	ID		46
	AuthID		02	# Requires CHV2
	KeyUsage	NonRepudiation

PublicKey AuthKey
	Label		"Authentication Key"
	ID		45
	KeyUsage	sign

PublicKey SignKey
	Label		"Non-repudiation Key"
	ID		46
	KeyUsage	NonRepudiation
