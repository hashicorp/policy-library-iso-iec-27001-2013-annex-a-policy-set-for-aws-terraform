# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-with-resource-tags-filter-config.sentinel"
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

param "resourceTags" {
  value = "{\"Environment\":\"production\"}"
}

test {
  rules = {
    main = true
  }
}