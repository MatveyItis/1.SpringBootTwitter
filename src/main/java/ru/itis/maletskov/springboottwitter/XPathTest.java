package ru.itis.maletskov.springboottwitter;


import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class XPathTest {
    private static final String XML_URI = "https://www.w3schools.com/xml/books.xml";
    private static final String EXPRESSION_1 = "//title[@lang='en']";
    private static final String EXPRESSION_2 = "//book[//title[@lang='en']]";
    private static final String EXPRESSION_3 = "/bookstore/book[year > 2004]/title";
    private static final String EXPRESSION_4 = "//book[//title[@lang='en']]/@category";

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            XPathTest xPathTest = new XPathTest();
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
    }

    public XPathTest() throws Exception {
        // Initialize some stuff
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder;
        try {
            builder = factory.newDocumentBuilder();
        } catch (ParserConfigurationException ex) {
            throw new Exception("Can't crate DocumentBuilder");
        }
        // Load XML document from WWW
        Document doc;
        try {
            doc = builder.parse(XML_URI);
        } catch (IOException ex) {
            throw new Exception("Can't get XML by URL " + XML_URI);
        } catch (SAXException ex) {
            throw new Exception("Can't read downloaded XML.");
        }

        // Initialize xPath expression
        XPathFactory xPathfactory = XPathFactory.newInstance();
        XPath xpath = xPathfactory.newXPath();
        XPathExpression expr;
        try {
            expr = xpath.compile(EXPRESSION_4);
        } catch (XPathExpressionException ex) {
            throw new Exception("Can't parse xPath expression " + EXPRESSION_1);
        }

        // Use xPath on our document
        NodeList nodeList;
        try {
            nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
        } catch (XPathExpressionException ex) {
            throw new Exception("Can't evaluate expression");
        }

        // Output text of elements
        for (int i = 0; i < nodeList.getLength(); i++) {
            System.out.println(nodeList.item(i).getTextContent());
        }
    }
}
