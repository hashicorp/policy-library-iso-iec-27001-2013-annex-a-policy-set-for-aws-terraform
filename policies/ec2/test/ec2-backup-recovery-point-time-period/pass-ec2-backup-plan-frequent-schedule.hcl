# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-ec2-backup-plan-frequent-schedule.sentinel"
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
    main = true
  }
}
