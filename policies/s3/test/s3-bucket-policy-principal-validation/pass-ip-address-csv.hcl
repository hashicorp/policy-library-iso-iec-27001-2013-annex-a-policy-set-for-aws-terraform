# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-ip-address-csv-config.sentinel"
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
  value = "10.0.0.1, 192.168.1.0/24, 2001:db8::/32"
}

test {
  rules = {
    main = true
  }
}