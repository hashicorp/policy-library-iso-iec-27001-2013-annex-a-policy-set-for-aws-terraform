# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-igw-attached-to-authorized-vpc.sentinel"
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

param "authorized_vpc_ids" {
  value = "vpc-authorized123"
}

test {
  rules = {
    main = true
  }
}
