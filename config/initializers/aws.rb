require 'aws-sdk'

Aws.config.update(
  region: 'us-west-2',
  force_path_style: true,
  credentials: Aws::Credentials.new(
    "AKIAI5WNYPYT4J3BFWAQ",
    "skPoFJLWFmM4Td5fjPRC/JGwwiq60M3WeQkMfyQ+"
  )
)