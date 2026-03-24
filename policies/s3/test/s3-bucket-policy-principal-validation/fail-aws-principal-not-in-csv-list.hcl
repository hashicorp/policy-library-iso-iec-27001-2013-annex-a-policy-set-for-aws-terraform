# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
  module {
    source = "./mocks/fail/fail-aws-principal-not-in-csv-list-config.sentinel"
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

param "awsPrincipals" {
  value = "arn:aws:iam::111122223333:root, arn:aws:iam::444455556666:root"
}

test {
  rules = {
    main = false
  }
}