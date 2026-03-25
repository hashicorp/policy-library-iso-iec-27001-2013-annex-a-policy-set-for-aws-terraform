# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-specific-policy-arn-attached-to-user-config.sentinel"
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

param "policyARN" {
  value = "arn:aws:iam::123456789012:policy/example-policy"
}

test {
  rules = {
    main = true
  }
}