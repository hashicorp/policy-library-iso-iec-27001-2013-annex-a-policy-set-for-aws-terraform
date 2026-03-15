
mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-s3-policy-matches-control-policy.sentinel"
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
  value = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"AllowCrossAccountRead\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::123456789012:root\"},\"Action\":\"s3:GetObject\",\"Resource\":\"arn:aws:s3:::example-bucket/*\"}]}"
}

test {
  rules = {
    main = true
  }
}
