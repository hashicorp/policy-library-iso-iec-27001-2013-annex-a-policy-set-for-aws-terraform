# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/policy-success-log-group-with-required-specific-kms-key/mock-tfplan-v2.sentinel"
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

test {
  rules = {
    main = true
  }
}

param "kms_key_id" {
  value = "arn:aws:kms:us-east-1:123456789012:key/abcdef12-3456-7890-abcd-ef1234567890"
}
