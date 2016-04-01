package org.web.kyc.xml;

import org.restlet.ext.xml.DomRepresentation;
import org.w3c.dom.Document;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.stream.StreamSource;
import java.io.IOException;
import java.io.StringReader;

public class XmlDocument {

    private Document document;

    public XmlDocument(String s) {
        this.document = convertFromString(s);
    }

    private Document convertFromString(String s) {
        try {
            StringReader sr = new StringReader(s);
            StreamSource source = new StreamSource(sr);

            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer();
            DOMResult result = new DOMResult();
            transformer.transform(source, result);
            Document doc = (Document) result.getNode();
            return doc;
        } catch (TransformerException e) {
            throw new RuntimeException("Error converting String to XmlDocument", e);
        }
    }

    public DomRepresentation toDomRepresentation() {
        try {
            return convertToDomRepresentation();
        }
        catch (IOException e) {
            throw new RuntimeException("Error converting XmlDocument to DOM Representation", e);
        }
    }

    private DomRepresentation convertToDomRepresentation() throws IOException {
        DomRepresentation domRep = new DomRepresentation();
        domRep.setDocument(document);
        return domRep;
    }

}