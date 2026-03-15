mock "tfplan/v2" {
  module {
    source = "./mocks/fail/fail-ip-not-in-allowed-list.sentinel"
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

param "allowed_ips" {
  value = ["203.0.113.0/24", "10.0.0.0/8"]
}

test {
  rules = {
    main = false
  }
}