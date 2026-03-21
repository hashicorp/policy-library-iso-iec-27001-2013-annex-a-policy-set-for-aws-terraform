# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-redshift-encrypted-with-correct-kms-key.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "./mocks/pass/pass-redshift-encrypted-with-correct-kms-key-config.sentinel"
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

param "kms_key_id" {
  value = "arn:aws:kms:us-east-1:123456789012:key/correct-key-id"
}

test {
  rules = {
    main = true
  }
}