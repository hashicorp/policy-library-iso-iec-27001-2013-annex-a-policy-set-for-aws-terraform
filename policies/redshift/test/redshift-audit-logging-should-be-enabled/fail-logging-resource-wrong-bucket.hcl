# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-logging-resource-wrong-bucket.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "./mocks/fail/fail-logging-resource-wrong-bucket-config.sentinel"
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

param "bucketNames" {
  value = "allowed-bucket-1,allowed-bucket-2"
}

test {
  rules = {
    main = false
  }
}