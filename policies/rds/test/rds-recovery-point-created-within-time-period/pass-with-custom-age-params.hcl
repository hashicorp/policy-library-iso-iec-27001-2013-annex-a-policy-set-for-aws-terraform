# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-rds-recovery-point-within-timeframe-config.sentinel"
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

param "recoveryPointAgeValue" {
  value = 24
}

param "recoveryPointAgeUnit" {
  value = "hours"
}

test {
  rules = {
    main = true
  }
}