# Copyright IBM Corp. 2026
# SPDX-License-Identifier: BUSL-1.1

# This test verifies that when a role uses managed_policy_arns attribute,
# any aws_iam_role_policy_attachment resources for that role are ignored
# to prevent conflicts as per Terraform documentation

mock "tfplan/v2" {
  module {
    source = "./mocks/pass/pass-role-with-inline-managed-policy-arns-ignores-attachments.sentinel"
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

param "managedPolicyArns" {
  value = "arn:aws:iam::aws:policy/ReadOnlyAccess,arn:aws:iam::aws:policy/SecurityAudit"
}

test {
  rules = {
    main = true
  }
}