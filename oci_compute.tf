# Doc https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_instance

#NODE 1
resource "oci_core_instance" "ubuntu_1" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"

    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }

    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }

    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }

  availability_domain = data.oci_identity_availability_domains.list_availability_domains.availability_domains[0].name
  compartment_id      = var.oci_compartment_ocid
  #fault_domain        = var.oci_default_fault_domain

  create_vnic_details {
    assign_private_dns_record = "true"
    assign_public_ip          = "true" # Passez la valeur a false pour ne pas exposer votre vm sur internet
    subnet_id                 = oci_core_subnet.default_oci_core_subnet10.id
  }

  display_name = "master_ubuntu_1"

  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }

  is_pv_encryption_in_transit_enabled = "true"

  metadata = {
    "ssh_authorized_keys" = var.ssh_pub_key
  }

  shape = "VM.Standard.A1.Flex"
  shape_config {
    memory_in_gbs = "6" # Vous pouvez passer cette valeur a 24 max, 6 12 18 24
    ocpus         = "1" # vous pouvez passer cette valeur a 4 max, 1 2 3 4
  }

  source_details {
    source_id   = data.oci_core_images.list_images.images[0].id
    source_type = "image"
  }

  freeform_tags = {
    "${var.oci_tag_key}" = "${var.oci_tag_value}"
  }

}

# Pour créer d'autres VM décommentez simplement

#NODE 2
# resource "oci_core_instance" "ubuntu_2" {
#   agent_config {
#     is_management_disabled = "false"
#     is_monitoring_disabled = "false"

#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "Vulnerability Scanning"
#     }

#     plugins_config {
#       desired_state = "ENABLED"
#       name          = "Compute Instance Monitoring"
#     }

#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "Bastion"
#     }
#   }

#   availability_config {
#     recovery_action = "RESTORE_INSTANCE"
#   }

#   availability_domain = data.oci_identity_availability_domains.list_availability_domains.availability_domains[0].name
#   compartment_id      = var.oci_compartment_ocid
#   #fault_domain        = var.oci_default_fault_domain

#   create_vnic_details {
#     assign_private_dns_record = "true"
#     assign_public_ip          = "true"
#     subnet_id                 = oci_core_subnet.default_oci_core_subnet10.id
#   }

#   display_name = "worker_ubuntu_1"

#   instance_options {
#     are_legacy_imds_endpoints_disabled = "false"
#   }

#   is_pv_encryption_in_transit_enabled = "true"

#   metadata = {
#     "ssh_authorized_keys" = var.ssh_pub_key
#   }

#   shape = "VM.Standard.A1.Flex"
#   shape_config {
#     memory_in_gbs = "6"
#     ocpus         = "1"
#   }

#   source_details {
#     source_id   = data.oci_core_images.list_images.images[0].id
#     source_type = "image"
#   }

#   freeform_tags = {
#     "${var.oci_tag_key}" = "${var.oci_tag_value}"
#   }

# }


#NODE 3
# resource "oci_core_instance" "ubuntu_3" {
#   agent_config {
#     is_management_disabled = "false"
#     is_monitoring_disabled = "false"

#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "Vulnerability Scanning"
#     }

#     plugins_config {
#       desired_state = "ENABLED"
#       name          = "Compute Instance Monitoring"
#     }

#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "Bastion"
#     }
#   }

#   availability_config {
#     recovery_action = "RESTORE_INSTANCE"
#   }

#   availability_domain = data.oci_identity_availability_domains.list_availability_domains.availability_domains[0].name
#   compartment_id      = var.oci_compartment_ocid
#   #fault_domain        = var.oci_default_fault_domain

#   create_vnic_details {
#     assign_private_dns_record = "true"
#     assign_public_ip          = "true"
#     subnet_id                 = oci_core_subnet.default_oci_core_subnet10.id
#   }

#   display_name = "worker_ubuntu_2"

#   instance_options {
#     are_legacy_imds_endpoints_disabled = "false"
#   }

#   is_pv_encryption_in_transit_enabled = "true"

#   metadata = {
#     "ssh_authorized_keys" = var.ssh_pub_key
#   }

#   shape = "VM.Standard.A1.Flex"
#   shape_config {
#     memory_in_gbs = "6"
#     ocpus         = "1"
#   }

#   source_details {
#     source_id   = data.oci_core_images.list_images.images[0].id
#     source_type = "image"
#   }

#   freeform_tags = {
#     "${var.oci_tag_key}" = "${var.oci_tag_value}"
#   }

# }


#NODE 4
# resource "oci_core_instance" "ubuntu_4" {
#   agent_config {
#     is_management_disabled = "false"
#     is_monitoring_disabled = "false"

#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "Vulnerability Scanning"
#     }

#     plugins_config {
#       desired_state = "ENABLED"
#       name          = "Compute Instance Monitoring"
#     }

#     plugins_config {
#       desired_state = "DISABLED"
#       name          = "Bastion"
#     }
#   }

#   availability_config {
#     recovery_action = "RESTORE_INSTANCE"
#   }

#   availability_domain = data.oci_identity_availability_domains.list_availability_domains.availability_domains[0].name
#   compartment_id      = var.oci_compartment_ocid
#   #fault_domain        = var.oci_default_fault_domain

#   create_vnic_details {
#     assign_private_dns_record = "true"
#     assign_public_ip          = "true"
#     subnet_id                 = oci_core_subnet.default_oci_core_subnet10.id
#   }

#   display_name = "node_ubuntu_3"

#   instance_options {
#     are_legacy_imds_endpoints_disabled = "false"
#   }

#   is_pv_encryption_in_transit_enabled = "true"

#   metadata = {
#     "ssh_authorized_keys" = var.ssh_pub_key
#   }

#   shape = "VM.Standard.A1.Flex"
#   shape_config {
#     memory_in_gbs = "6"
#     ocpus         = "1"
#   }

#   source_details {
#     source_id   = data.oci_core_images.list_images.images[0].id
#     source_type = "image"
#   }

#   freeform_tags = {
#     "${var.oci_tag_key}" = "${var.oci_tag_value}"
#   }

# }
