package org.web.kyc.xqueries;

public enum XQueryEnum {

    ENTITY_DETAILS("qa-kyc-ubo-getEntityDetails.xqy"),
    DIRECT_OWNERS_LIST("qa-kyc-ubo-getDirectOwnersList.xqy"),
    SUBSIDIARIES_LIST("qa-kyc-ubo-getSubsidiariesList.xqy"),
    AUDIT_INFORMATION("qa-kyc-ubo-getOwnershipAuditTrail.xqy"),
    DIRECT_OWNERS_LIST_GRAPH("qa-kyc-ubo-getDirectOwnersListOnGraph.xqy"),
    SUBSIDIARIES_LIST_GRAPH("qa-kyc-ubo-getSubsidiariesListOnGraph.xqy");

    private String xQueryName;

    XQueryEnum(String xQueryName) {
        this.xQueryName = xQueryName;
    }

    public String getXQueryName() {
        return xQueryName;
    }
}
