# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1
# Test CSV parsing with spaces in parameters

mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-multiple-params-with-spaces.sentinel"
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
  value = "arn:aws:iam::111122223333:root , arn:aws:iam::444455556666:role/* , 777788889999"
}

param "servicePrincipals" {
  value = "cloudtrail.amazonaws.com , lambda.amazonaws.com"
}

param "ipAddresses" {
  value = "10.0.0.1 , 192.168.1.0/24"
}

test {
  rules = {
    main = true
  }
}