mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-redshift-encrypted-no-kms-key.sentinel"
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
  value = "arn:aws:kms:us-east-1:123456789012:key/required-key-id"
}

test {
  rules = {
    main = false
  }
}