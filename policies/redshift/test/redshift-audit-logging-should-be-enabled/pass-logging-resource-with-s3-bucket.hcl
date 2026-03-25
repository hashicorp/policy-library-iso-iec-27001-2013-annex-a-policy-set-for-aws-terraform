# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-logging-resource-with-s3-bucket-config.sentinel"
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
  value = "my-audit-logs-bucket,another-bucket"
}

test {
  rules = {
    main = true
  }
}