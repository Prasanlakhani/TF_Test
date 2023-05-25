/*****************************************
  Cloud Armor
 *****************************************/
resource "google_compute_security_policy" "policy" {
  //for_each = { for o in local.nestedforeach_p : o.resource => o... }
  name    = var.policy_name
  project = var.project

  dynamic "rule" {
    //for_each = { for o in local.nestedforeach_p : o.resource => o... }
    for_each = var.policy_rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = "SRC_IPS_V1"
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      description = rule.value.description
    }
  }

  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default rule"
  }
}
