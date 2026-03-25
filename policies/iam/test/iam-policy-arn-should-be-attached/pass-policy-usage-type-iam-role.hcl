# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-policy-usage-type-iam-role-config.sentinel"
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

param "policyUsageType" {
  value = "IAM_ROLE"
}

test {
  rules = {
    main = true
  }
}