
mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-igw-attachment-authorized-vpc.sentinel"
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

param "authorized_vpc_ids" {
  value = ["vpc-authorized888"]
}

test {
  rules = {
    main = true
  }
}
