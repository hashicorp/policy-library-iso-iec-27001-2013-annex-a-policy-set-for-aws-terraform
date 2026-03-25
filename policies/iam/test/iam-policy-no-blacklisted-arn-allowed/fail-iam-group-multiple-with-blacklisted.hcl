# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfconfig/v2" {
  module {
    source = "./mocks/fail/fail-iam-group-multiple-with-blacklisted-config.sentinel"
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

param "policyArns" {
  value = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::aws:policy/PowerUserAccess"
  ]
}

test {
  rules = {
    main = false
  }
}
