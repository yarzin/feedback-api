require 'aws-sdk'

Aws.config.update(
  region: 'us-west-2',
  force_path_style: true,
  credentials: Aws::Credentials.new(
    "AKIAI2KSMD27YVGOUVVA",
    "h39jmeuVHzlaI09CPVKz++crDbsVWp8Ogdl4gOMD"
  )
)