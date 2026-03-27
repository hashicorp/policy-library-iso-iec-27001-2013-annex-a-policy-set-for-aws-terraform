# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
  module {
    source = "./mocks/fail/fail-ip-not-in-allowed-list-config.sentinel"
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

param "ipAddresses" {
  value = "203.0.113.0/24, 10.0.0.0/8"
}

test {
  rules = {
    main = false
  }
}