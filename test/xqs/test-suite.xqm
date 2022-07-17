xquery version "3.1";

(:~ This library module contains XQSuite tests for the mwjl-app app.
 :
 : @author MedievalMatt
 : @version 1.0.0
 : @see http://www.matthewedavis.net
 :)

module namespace tests = "http://sandbox.matthewedavis.net/apps/mwjl-app/tests";

declare namespace test="http://exist-db.org/xquery/xqsuite";



declare
    %test:name('one-is-one')
    %test:assertTrue
    function tests:tautology() {
        1 = 1
};
