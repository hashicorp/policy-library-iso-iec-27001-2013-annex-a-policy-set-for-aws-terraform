# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1
# Test that wildcard principal without conditions fails

mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-wildcard-principal-no-condition.sentinel"
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
    main = false
  }
}