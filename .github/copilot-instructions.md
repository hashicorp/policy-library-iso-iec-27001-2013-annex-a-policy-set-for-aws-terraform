# GitHub Copilot Instructions — ISO/IEC 27001:2013 Annex A Sentinel Policy Library for AWS

## Repository Purpose

This repository contains pre-written HashiCorp Sentinel policies for AWS Terraform that enforce ISO/IEC 27001:2013 Annex A security controls. The policies are consumed by HCP Terraform and Terraform Enterprise to validate infrastructure-as-code configurations before they are applied. All policies use `enforcement_level = "advisory"`, meaning violations surface as warnings without blocking applies. The library currently contains approximately 107 policies covering 41 AWS services.

---

## PR Review Scope (Mandatory)

When reviewing a pull request, Copilot must only review and comment on files and lines changed in that PR.

- Only report findings and suggestions for code introduced or modified in the PR diff.
- Do not raise issues for untouched files, untouched lines, or pre-existing repository-wide debt.
- If context from an unchanged file is needed to validate changed code, reference it briefly but place findings only on the changed PR content.
- Do not suggest opportunistic refactors outside the PR scope.
- If a broader issue is noticed outside changed files, mention it only as a non-blocking note and explicitly state it is out of scope for this PR.

## Severity Levels

Use these severity levels consistently in review comments:

**BLOCKING**
- Directory structure violations
- Missing tests
- Missing required documentation file
- Policy logic mismatch between code and description

**ADVISORY**
- Grammar and spelling issues
- Minor naming inconsistencies
- Documentation clarity improvements

## Review Comment Format

Copilot should structure review comments as:

```
[SEVERITY] Title

Description:
Explain the issue.

Location:
File path and line reference.

Recommendation:
Provide a concrete fix or example.
```

Example:

```text
BLOCKING: Policy name mismatch

Description:
The value of const.policy_name must match the Sentinel filename exactly.

Location:
policies/s3/s3-bucket-encryption.sentinel

Recommendation:
Change "policy_name": "s3_bucket_encryption" to "policy_name": "s3-bucket-encryption".
```

---

## Sentinel Language Basics

Understanding these file types is essential for reviewing PRs in this repository:

- **`.sentinel` files** — Policy-as-code files. The `main` rule (always the last rule) evaluates to `true` (pass) or `false` (fail). Policies import reusable modules with `import "module_name" as alias`.
- **`.hcl` files** — Test configuration files. They declare mock data sources and define expected rule outcomes with `test { rules = { main = true } }` or `test { rules = { main = false } }`.
- **Mock `.sentinel` files** — Simulate the data that Terraform normally provides at runtime (`tfplan/v2`, `tfconfig/v2`, `tfstate/v2`). They define a `resources` map that replicates what Terraform exports.
- **`sentinel.hcl`** — The root configuration file that registers all policies, their source paths, enforcement levels, and optional parameters.

---

## Required Directory Layout

Every new policy must follow this exact structure. Flag any deviation as a **blocking** issue.

```
policies/
  [service]/
    [service]-[description].sentinel        ← policy file
    test/
      [policy-name]/                        ← directory name must match .sentinel basename exactly
        [success|failure|pass|fail]-[scenario].hcl   ← test case files
        mocks/
          [policy-success|policy-failure|pass|fail]-[scenario]/  ← mock directory; name must match test file basename
            mock-tfplan-v2.sentinel         ← OR mock-tfconfig-v2.sentinel / mock-tfstate-v2.sentinel

          Alternative legacy layout:
          pass/
            [pass-scenario].sentinel
          fail/
            [fail-scenario].sentinel

docs/
  policies/
    [policy-name].md                        ← exact same name as the .sentinel file (minus extension)

sentinel.hcl                                ← must register every policy
modules/                                    ← shared modules; must not be modified in feature PRs
```

---

## Naming Rules

### 1. Policy files
- Format: `[service]-[description].sentinel`
- All lowercase, hyphen-separated, no underscores, no equals signs
- Located at `policies/[service]/[filename].sentinel`
- Valid: `ecr-image-scanning-enabled.sentinel`, `rds-ensure-automatic-backups-enabled.sentinel`
- Invalid: `ecr_image_scanning.sentinel`, `rds-ensure=automatic-backups.sentinel`

### 2. Test case files
- Test files must begin with one of: `success-`, `failure-`, `pass-`, `fail-`, followed by a scenario description
- Located at `policies/[service]/test/[policy-name]/[success|failure|pass|fail]-[scenario].hcl`
- The parent directory name must exactly match the `.sentinel` policy basename

### 3. Mock directories
- Two supported mock directory layouts are valid:
  - Standard layout: `mocks/policy-success-[scenario]/`, `mocks/policy-failure-[scenario]/`
  - Other layout: `mocks/pass/` for all pass mocks and `mocks/fail/` for all fail mocks
- For other layout, each test file should map to the correct folder by expected outcome:
  - pass test files use `source = "./mocks/pass/[test-case].sentinel"`
  - fail test files use `source = "./mocks/fail/[test-case].sentinel"`
- Always verify the `source = "./mocks/..."` path in the `.hcl` test file points to an existing mock file.

### 4. Documentation files
- Format: `[policy-basename].md` — the exact same name as the `.sentinel` file, minus the extension
- Located at `docs/policies/[policy-name].md`

---

## Required Policy File Structure

Check every new or modified `.sentinel` file for all of the following, in order:

```sentinel
# [One-line description of what the policy checks]

# Copyright IBM Corp. 2024, 2025
# SPDX-License-Identifier: BUSL-1.1

import "tfplan/v2" as tfplan        # or tfconfig/v2 or tfstate/v2
import "tfresources" as tf
import "report" as report
import "collection" as collection
# Common imports may also include:
# import "collection/maps" as maps

const = {
    "policy_name": "[filename-without-extension]",   # MUST match filename exactly (dashes only)
    "message":     "...",
    ...
}

# ... resource filtering and violation detection logic ...

summary = {
    "policy_name": const.policy_name,    # or the string literal — must match filename
    "violations":  map violations as _, v { { "address": ..., "module_address": ..., "message": ... } },
}

print(report.generate_policy_report(summary))

main = rule {
    violations is empty
}
```

**Blocking checks:**
- Copyright header must be `# Copyright IBM Corp. 2024, 2025` or `# Copyright IBM Corp. 2025`
- SPDX line must be `# SPDX-License-Identifier: BUSL-1.1`
- `import "report" as report` must be present
- `const.policy_name` value must match the `.sentinel` filename exactly — using hyphens, not underscores, not equals signs. Example: a file named `s3-bucket-should-be-encrypted-at-rest.sentinel` must have `"policy_name": "s3-bucket-should-be-encrypted-at-rest"`, not `"s3-bucket=should-be-encrypted-at-rest"`
- `summary` must have both `"policy_name"` and `"violations"` keys
- `print(report.generate_policy_report(summary))` must be called
- The policy file must end with the `main` rule.
- `main = rule { [violations_variable] is empty }` must be the final rule

---

## sentinel.hcl Registration

Every `.sentinel` file under `policies/` must be registered in `sentinel.hcl`:

```hcl
policy "[policy-name]" {
  source            = "./policies/[service]/[filename].sentinel"
  enforcement_level = "advisory"
}
```

**Rules:**
- `enforcement_level` must always be `"advisory"` — flag `soft-mandatory` or `hard-mandatory` as blocking
- Some policies are parameterized: multiple `policy` blocks may point to the same `.sentinel` source file with different `params`. This is valid and correct — do not flag it as a duplicate.

```hcl
# Valid example: two policy entries sharing one .sentinel file
policy "elb-ensure-valid-desync-mitigation-mode-application-load-balancer" {
  source            = "./policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel"
  enforcement_level = "advisory"
  params = { lb_type = "application" }
}

policy "elb-ensure-valid-desync-mitigation-mode-network-load-balancer" {
  source            = "./policies/elb/elb-ensure-valid-desync-mitigation-mode.sentinel"
  enforcement_level = "advisory"
  params = { lb_type = "network" }
}
```

---

## Test File Requirements

For every new policy, both success and failure test cases are required.

**Structure of each `.hcl` test file:**
```hcl
# Copyright IBM Corp. 2024, 2025
# SPDX-License-Identifier: BUSL-1.1

mock "tfplan/v2" {                          # matches the import in the .sentinel file
  module {
    source = "./mocks/policy-success-[scenario]/mock-tfplan-v2.sentinel"
  }
}

mock "tfresources" {
  module { source = "../../../../modules/tfresources/tfresources.sentinel" }
}

mock "report" {
  module { source = "../../../../modules/mocks/report/report.sentinel" }
}

test {
  rules = {
    main = true    # true for success tests, false for failure tests
  }
}
```

**Accepted mock source path patterns:**
- Preferred standard pattern:
  - `./mocks/policy-success-[scenario]/mock-tfplan-v2.sentinel`
  - `./mocks/policy-failure-[scenario]/mock-tfplan-v2.sentinel`
- Repository legacy pattern (also valid when present in existing policy tests):
  - `./mocks/[test-case-name]/mock-tfplanv2.sentinel`
  - `./mocks/pass/[test-case].sentinel` and `./mocks/fail/[test-case].sentinel`

Treat these path variants as valid if the referenced mock file exists and the test expectation (`main = true/false`) is correct.

**Blocking checks:**
- At least one `success-*.hcl` file must exist in the test directory
- At least one `failure-*.hcl` file must exist in the test directory
- All `.hcl` test files must have copyright and SPDX headers
- `success-*.hcl` files must have `main = true`; `failure-*.hcl` files must have `main = false`
- Every mock `source =` path must reference a directory that actually exists in the repository

---

## Documentation Requirements

Every new policy must have a corresponding `docs/policies/[policy-name].md` file. Check for all of the following:

```markdown
# [Human-readable title describing what the policy checks]

| Provider            | Category   |
|---------------------|------------|
| Amazon Web Services | [category] |

## Description

[Explanation of what the control checks, why it matters, and when it fails.]

This rule is covered by the [policy-name](https://github.com/hashicorp/policy-library-.../blob/main/policies/[service]/[policy-name].sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - [policy-name].sentinel
      ...
      This result means that all resources have passed the policy check for the policy [policy-name].
      ✓ Found 0 resource violations
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - [policy-name].sentinel
      ...
```
```

**Blocking checks:**
- `docs/policies/[policy-name].md` must exist for every new `.sentinel` policy file
- H1 title must describe what the policy checks

**Advisory checks (flag but do not block):**
- Provider/Category table must be present
- `## Description` section must be present with substantive content
- `## Policy Results (Pass)` and `## Policy Results (Fail)` sections must be present with fenced `bash` trace blocks
- The policy name shown in the trace (e.g., `Pass - ecr-image-scanning-enabled.sentinel`) must match the actual `.sentinel` filename
- The policy link must point to the correct file path on the `main` branch
- Flag spelling mistakes and grammatical errors in the Description section

---

## Policy Logic Correctness Validation (Semantic Check)

For every new or modified `.sentinel` file, cross-reference the policy code against its documentation to verify the code actually implements what the description states.

**How to perform this check:** Read both the `## Description` in `docs/policies/[policy-name].md` and the Sentinel code together, then verify the following alignment points:

### A. Resource type alignment
The description names an AWS service or resource. The code must check the corresponding Terraform resource type via `.type("aws_resource_type")`. Flag if there is a mismatch.

Correct mappings:
| Description mentions | Code must use |
|---|---|
| Amazon ECR repository | `aws_ecr_repository` |
| RDS DB instance | `aws_db_instance` |
| RDS DB cluster | `aws_rds_cluster` |
| S3 general purpose bucket | `aws_s3_bucket` |
| EKS cluster | `aws_eks_cluster` |
| ECS task definition | `aws_ecs_task_definition` |
| Lambda function | `aws_lambda_function` |

### B. Attribute alignment
The description states which attribute or feature is being validated. The code must check that exact attribute via `maps.get(res, "values.[attribute]", default)`. Flag if the attribute in the code does not correspond to the feature described.

Example: If the description says "checks whether `backup_retention_period` is configured", the code must read `values.backup_retention_period`, not a different field.

### C. Condition alignment
The description states what condition must be satisfied. The violation detection logic (`filter`/`collection.reject`) must implement exactly that condition. Flag if:
- The description says a feature "must be enabled" but the code checks a different field
- The description specifies numeric bounds (e.g., "between 7 and 35 days") but the code uses different values
- The description says "must use AWS KMS key" but the code accepts any encryption type (e.g., AES256)
- The code logic is inverted relative to what the description says should pass or fail

### D. Violation message alignment
`const.message` is displayed to users when a violation is detected. It must accurately describe what failed and be consistent with the `## Description`. Flag if `const.message` contradicts or significantly diverges from the description's intent.

### E. Top-comment alignment
The first line(s) of the `.sentinel` file contain a descriptive comment (e.g., `# This policy checks if resources of type 'aws_ecr_repository' have image scanning configuration enabled`). This comment must match the actual code logic — flag if it describes a different resource type or condition.

**Severity:** Flag policy logic mismatches as **blocking** — a policy that doesn't implement its description is functionally incorrect regardless of structural validity.

**Example of a mismatch to flag:**
> Description states: "The policy fails if the private ECR repository isn't configured for scan on push **or continuous scanning**."
> Code only checks `scan_on_push`; continuous scanning is not validated.
> Correct flag: "The description states the policy covers both scan-on-push and continuous scanning, but the code only validates `scan_on_push`. Either update the code to also check for continuous scanning, or narrow the description to reflect that only `scan_on_push` is validated."

**Example of correct alignment:**
> Description: "checks whether `backup_retention_period` is set to a value between 7 and 35"
> Code: `backup_retention_period_value >= 7 and backup_retention_period_value <= 35`
> No flag needed.

---

## What Copilot Must NOT Flag

- **Platform path substitution in `ci.yml`**: The `sed` command replacing `darwin/arm64` with `linux/amd64` is intentional for cross-platform CI. Do not flag it.
- **Multiple `policy` blocks pointing to the same `.sentinel` source file** in `sentinel.hcl`: This is the correct pattern for parameterized policies. Do not flag as duplicate.
- **Anything inside `modules/`**: Shared modules (`tfresources`, `tfplan-functions`, `tfconfig-functions`, `report`) are not modified in feature PRs. Do not review or suggest changes to these files.
- **`collection` and `collection/maps` imports**: These are standard Sentinel stdlib imports. Do not flag their usage.

---

## Shared Module API Reference

These modules are imported by every policy. Understanding their API prevents false-positive review comments.

### `tfresources` module
```sentinel
import "tfresources" as tf

# Filter resources from Terraform plan by type
resources = tf.plan(tfplan.planned_values.resources).type("aws_resource_type").resources

# Filter resources from Terraform config by type
resources = tf.config(tfconfig.resources).type("aws_resource_type").resources
```
Use `tf.plan(...)` when checking attribute values set during apply. Use `tf.config(...)` when checking resource configuration structure (e.g., referenced resource associations).

### `report` module
```sentinel
import "report" as report

summary = {
    "policy_name": "policy-name-here",
    "violations": map violations as _, v {
        {
            "address":        v.address,
            "module_address": v.module_address,
            "message":        const.message,
        }
    },
}

print(report.generate_policy_report(summary))
```

### `collection` and `collection/maps` (Sentinel stdlib)
```sentinel
import "collection" as collection
import "collection/maps" as maps

# Reject resources that pass the condition (keeps violations)
violations = collection.reject(resources, func(res) {
    value = maps.get(res, "values.attribute_name", default_value)
    return value is desired_value   # return true = compliant (not a violation)
})

# Alternatively: filter keeps items where the condition is true
violations = filter resources as _, res {
    not (maps.get(res, "values.attribute", false) is true)
}
```

---

## Pattern Reference (Wider HashiCorp Sentinel Library Ecosystem)

This library follows the same conventions as other HashiCorp Sentinel policy libraries (CIS Benchmarks, NIST 800-53, PCI-DSS). Common patterns:

- **Plan-time check**: Use `tfplan/v2` when the resource attribute is set by Terraform at apply time (most policies).
- **Config-time check**: Use `tfconfig/v2` when checking resource configuration structure or cross-resource references (e.g., verifying a separate encryption configuration resource is linked to a bucket).
- **State-time check**: Use `tfstate/v2` when checking the current state of deployed resources (rare in this library).
- **Violation detection**: Either `collection.reject` (keeping non-compliant resources) or `filter ... { not (...) }` — both patterns are valid.
- **Parameterized thresholds**: Policies accept Sentinel `param` declarations when thresholds are configurable (e.g., `backup_retention_period`, `password_age`). These are passed via `params` in `sentinel.hcl`.
