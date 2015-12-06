class WelcomeController < ApplicationController

  def index
    policy_document = '{"expiration": "2020-01-01T00:00:00Z",
        "conditions": [
          {"bucket": "' + Rails.application.config.amazons3[:aws_bucket_name] + '"},
          ["starts-with", "$key", "uploads/"],
          {"acl": "private"},
          {"success_action_redirect": "https://uploadfile2amazon.herokuapp.com/uploaded"},
          ["starts-with", "$Content-Type", ""],
          ["content-length-range", 0, 1048576]
        ]
      }'

    @aws_s3_bucket_name = Rails.application.config.amazons3[:aws_bucket_name]
    @aws_s3_id = Rails.application.config.amazons3[:aws_secret_id]
    @aws_s3_key = Rails.application.config.amazons3[:aws_secret_key]
    @policy = Base64.encode64(policy_document).gsub("\n","")

    @signature = Base64.encode64(
        OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new('sha1'),
            Rails.application.config.amazons3[:aws_secret_key], @policy)
    ).gsub("\n","")

  end

  def uploaded

  end
end
