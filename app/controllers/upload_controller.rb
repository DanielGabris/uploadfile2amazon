class UploadController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => :s3sign
def index
    requests = ""
end
# Post s3sign - Generate Policy & Signature.
def s3sign
#   policy = Base64.encode64("{
#  		"expiration": "2020-01-01T00:00:00Z",
#  		"conditions": [
#    			{"bucket": "lezyeoh"},
#    			["starts-with", "$key", ""],
#    			{"acl": "private"},
#    			["starts-with", "$Content-Type", ""],
#    			["starts-with", "$filename", ""],
#    			["content-length-range", 0, 524288000]
#  	]}").gsub(/\n|\r/, '')
#      signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), params[:awssecretkey], policy)).gsub(/\n| |\r/, '')
end
end

