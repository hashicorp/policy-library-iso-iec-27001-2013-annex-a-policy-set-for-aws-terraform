# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1


mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-no-inter-account-permissions.sentinel"
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

param "controlPolicy" {
  value = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"AllowSameAccountAccess\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::111111111111:user/admin\"},\"Action\":\"s3:*\",\"Resource\":\"arn:aws:s3:::example-bucket/*\"}]}"
}

test {
  rules = {
    main = true
  }
}
