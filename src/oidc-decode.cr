require "http/client"
require "json"

## Nick Brandaleone - December 2023
##
## This program prints out a decoded OIDC token.
## USAGE: gcloud auth print-identity-token | ./oidc-decode

input = gets

# Remove whitespace
exit unless input
arr = input.split(".")

# Array must be of size 3
exit unless arr.size == 3

header = Base64.decode_string(arr[0])
claims = Base64.decode_string(arr[1])

# Make the output a little easier to read
pretty_header = header.gsub(",","\n\t").sub("{","").sub("}","")
pretty_claims = claims.gsub(",","\n\t").sub("{","").sub("}","")

# Print decoded OIDC token
puts "Header:"
puts "\t" + pretty_header
puts "Claims:"
puts "\t" + pretty_claims
