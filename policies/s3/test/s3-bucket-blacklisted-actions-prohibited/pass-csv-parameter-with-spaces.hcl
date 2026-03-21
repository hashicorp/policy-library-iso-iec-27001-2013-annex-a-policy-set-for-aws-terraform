# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-csv-parameter-with-spaces.sentinel"
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

param "blacklistedActionPattern" {
  value = "s3:DeleteObject, s3:PutBucketPolicy, s3:DeleteBucket"
}

param "current_account_id" {
  value = "111111111111"
}

test {
  rules = {
    main = true
  }
}