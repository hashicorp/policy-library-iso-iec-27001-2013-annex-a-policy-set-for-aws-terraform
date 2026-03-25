# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/policy-failure-dynamodb-disallowed-kms-key/mock-tfplan-v2.sentinel"
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

param "kmsKeyArns" {
  value = "arn:aws:kms:us-east-1:123456789012:key/allowed-1111-2222-3333-444444444444"
}

test {
  rules = {
    main = false
  }
}