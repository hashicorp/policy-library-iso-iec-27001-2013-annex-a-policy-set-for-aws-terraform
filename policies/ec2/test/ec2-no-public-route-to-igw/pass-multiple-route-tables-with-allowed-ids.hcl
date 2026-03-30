# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-multiple-route-tables-with-allowed-ids.sentinel"
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

param "routeTableIds" {
  value = "rtb-allowed123, rtb-allowed456"
}

test {
  rules = {
    main = true
  }
}