xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace m = "http://www.minorworksoflydgate.net/model";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare option output:method "xhtml";
declare option output:media-type "application/xhtml+xml";
declare option output:omit-xml-declaration "no";
declare option output:html-version "5.0";
declare option output:indent "no";
declare option output:include-content-type "no";

declare variable $exist:root as xs:string := 
    request:get-parameter("exist:root", "xmldb:exist:///db/apps");
declare variable $exist:controller as xs:string := 
    request:get-parameter("exist:controller", "/MWJL-app");

declare variable $text := request:get-data(); (:this variable allows the pipeline to work:)

<html>
    <head>
        <title>Landing page</title>
    </head>
    <body>
        <h1>{$text ! string()}</h1>
        <p><a href="titles">Titles</a></p>
    </body>
</html>