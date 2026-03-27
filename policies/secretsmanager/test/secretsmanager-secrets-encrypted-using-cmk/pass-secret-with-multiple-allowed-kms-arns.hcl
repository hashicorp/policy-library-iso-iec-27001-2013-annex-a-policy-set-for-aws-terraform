# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-secret-with-multiple-allowed-kms-arns.sentinel"
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
  value = "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab,arn:aws:kms:us-east-1:111122223333:key/abcd1234-56ef-78gh-90ij-klmnopqrstuv"
}

test {
  rules = {
    main = true
  }
}