# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-redshift-invalid-node-type.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "./mocks/fail/fail-redshift-invalid-node-type-config.sentinel"
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

param "nodeTypes" {
  value = "dc1.large,dc2.large"
}

test {
  rules = {
    main = false
  }
}