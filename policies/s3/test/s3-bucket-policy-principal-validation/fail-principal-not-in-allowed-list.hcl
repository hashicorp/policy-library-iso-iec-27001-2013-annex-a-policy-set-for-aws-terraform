mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-principal-not-in-allowed-list.sentinel"
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

param "allowed_principals" {
  value = ["arn:aws:iam::123456789012:root", "arn:aws:iam::111111111111:root"]
}

test {
  rules = {
    main = false
  }
}