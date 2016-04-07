package org.web.kyc.xqueries;

public enum XQueryEnum {

    ENTITY_DETAILS("qa-kyc-ubo-getEntityDetails.xqy"),
    DIRECT_OWNERS_LIST("qa-kyc-ubo-get-DO-subs-List.xqy"),
    SUBSIDIARIES_LIST("qa-kyc-ubo-getSubsidiariesList.xqy");
    private String xQueryName;

    XQueryEnum(String xQueryName) {
        this.xQueryName = xQueryName;
    }

    public String getXQueryName(){
        return xQueryName;
    }
}
