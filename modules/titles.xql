xquery version "3.1";

(:==========
Part of mwjl-app
Build model (in model namespace, with "m:" prefix) for titles list
==========:)

(:==========
Declare namespaces
==========:)
declare namespace mwjl = "http://minorworksoflydgate.net/mwjl";
declare namespace m = "http://minorworksofjohnlydgate.net/model";
declare namespace tei = "http://www.tei-c.org/ns/1.0";

(:==========
Declare global variables to path
=======∏===:)
declare variable $exist:root as xs:string := 
    request:get-parameter("exist:root", "xmldb:exist:///db/apps");
declare variable $exist:controller as xs:string := 
    request:get-parameter("exist:controller", "/mwjl-app");
declare variable $path-to-data as xs:string := 
    $exist:root || $exist:controller || '/data';
(:===
Declare variable
===:)

declare variable $works-coll := collection($path-to-data || '/texts');
declare variable $works as element(tei:TEI)+ := $works-coll/tei:TEI;
<m:titles> 
{
    for $work in $works 
        order by $work//tei:titleStmt/tei:title/tei:title[@type='main'], $work//tei:titleStmt/tei:title/tei:title[@type='sub'] 
    return
        <m:title>
        { 
            ($work//tei:titleStmt/tei:title/tei:title[@type='main'] || ': ' || $work//tei:titleStmt/tei:title/tei:title[@type='sub']) ! fn:normalize-space(.) ! fn:string(.)
        }
        </m:title>
        
}
</m:titles>