# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfconfig/v2" {
  module {
    source = "./mocks/fail/fail-notebook-kms-key-arn-not-in-allowed-list-config.sentinel"
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

param "kmsKeyArns" {
  value = "arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789012,arn:aws:kms:us-west-2:123456789012:key/abcdefgh-1234-5678-90ab-cdefghijklmn"
}

test {
  rules = {
    main = false
  }
}