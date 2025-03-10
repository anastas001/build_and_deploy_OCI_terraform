#Doc https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_availability_domains
data "oci_identity_availability_domains" "list_availability_domains" {
    compartment_id = var.oci_tenancy_ocid
}

#Doc https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_images
# Récupere l'ID de l'image OS la plus récente
data "oci_core_images" "list_images" {
    #Required
    compartment_id = var.oci_compartment_ocid

    #Optional
    operating_system = "Canonical Ubuntu"
    operating_system_version = "22.04"
    shape = "VM.Standard.A1.Flex"
    state = "AVAILABLE"
    sort_by = "TIMECREATED"
}
