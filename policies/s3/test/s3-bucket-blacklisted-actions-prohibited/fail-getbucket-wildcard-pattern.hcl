# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-getbucket-wildcard-pattern.sentinel"
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
  value = "s3:GetBucket*,s3:DeleteObject"
}

param "current_account_id" {
  value = "111111111111"
}

test {
  rules = {
    main = false
  }
}