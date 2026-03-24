# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

# Test case: controlPolicy parameter exceeds 1024 characters
# Expected: Policy should fail due to invalid parameter

mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-policy-matches-control-permissions-config.sentinel"
  }
}

mock "tfresources" {
  module {
    source = "../../../../modules/tfresources/tfresources.sentinel"
  }
}

mock "report" {
  module {
    source = "../../../../modules/mocks/report/report.sentinel"
  }
}

# This controlPolicy is intentionally over 1024 characters
param "controlPolicy" {
  value = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"AllowInterAccountAccess\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::123456789012:root\"},\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::example-bucket/*\",\"Condition\":{\"StringEquals\":{\"aws:SourceAccount\":\"123456789012\",\"aws:SourceArn\":\"arn:aws:s3:::example-bucket/*\",\"s3:x-amz-server-side-encryption\":\"AES256\",\"s3:x-amz-server-side-encryption-aws-kms-key-id\":\"arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012\",\"s3:x-amz-acl\":\"bucket-owner-full-control\",\"s3:x-amz-grant-read\":\"id=canonical-user-id-that-is-very-long-to-exceed-the-limit\",\"s3:x-amz-grant-write\":\"id=canonical-user-id-that-is-very-long-to-exceed-the-limit\",\"s3:x-amz-grant-read-acp\":\"id=canonical-user-id-that-is-very-long-to-exceed-the-limit\",\"s3:x-amz-grant-write-acp\":\"id=canonical-user-id-that-is-very-long-to-exceed-the-limit\",\"s3:x-amz-grant-full-control\":\"id=canonical-user-id-that-is-very-long-to-exceed-the-limit\",\"s3:x-amz-storage-class\":\"STANDARD\",\"s3:x-amz-website-redirect-location\":\"https://example.com/very/long/path/to/exceed/character/limit\",\"s3:x-amz-content-sha256\":\"UNSIGNED-PAYLOAD\",\"s3:x-amz-copy-source\":\"bucket/key\",\"s3:x-amz-metadata-directive\":\"COPY\",\"s3:x-amz-tagging-directive\":\"COPY\"}}}]}"
}

test {
  rules = {
    main = false
  }
}