----------------------------------------------------------------------------
-- (c) Copyright IBM Corp. 2007 All rights reserved.
-- 
-- The following sample of source code ("Sample") is owned by International 
-- Business Machines Corporation or one of its subsidiaries ("IBM") and is 
-- copyrighted and licensed, not sold. You may use, copy, modify, and 
-- distribute the Sample in any form without payment to IBM, for the purpose of 
-- assisting you in the development of your applications.
-- 
-- The Sample code is provided to you on an "AS IS" basis, without warranty of 
-- any kind. IBM HEREBY EXPRESSLY DISCLAIMS ALL WARRANTIES, EITHER EXPRESS OR 
-- IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. Some jurisdictions do 
-- not allow for the exclusion or limitation of implied warranties, so the above 
-- limitations or exclusions may not apply to you. IBM shall not be liable for 
-- any damages you suffer as a result of using, copying, modifying or 
-- distributing the Sample, even if IBM has been advised of the possibility of 
-- such damages.
----------------------------------------------------------------------------
--
-- SOURCE FILE NAME: simple_xmlproc_client.db2
--
-- SAMPLE: How to call the DB2 C stored procedure contained in
--         simple_xmlproc.sqc
--
-- To run this script from the CLP:
--    1.  EXTERNAL DEPENDENCIES:
--        Ensure existence of database for precompile purposes.
--        Ensure that the stored procedures called from this program have
--        been built and cataloged with the database (see the instructions in
--        xquery_xmlproc.sqc).
-- 
--    issue the command "db2 -td@ -vf <script-name>"
--    where <script-name> represents the name of this script
----------------------------------------------------------------------------
-- For more information on the sample programs, see the README file.
--
-- For information on developing C applications, see the C Guide
-- and Reference.
--
-- For information on using SQL statements, see the SQL Reference.
--
-- For the latest information on programming, building, and running DB2
-- applications, visit the DB2 application development website:
--     http://www.software.ibm.com/data/db2/udb/ad
-----------------------------------------------------------------------------

-- connect to the SAMPLE database
CONNECT TO sample@

-- creating procedure
CALL Simple_XML_Proc_C ( XMLPARSE(DOCUMENT '
                          <customerinfo Cid="5002">
                                <name>Kathy Smith</name>
                                       <addr country="Canada">
                                             <street>25 EastCreek</street>
                                             <city>Markham</city>
                                             <prov-state>Ontario</prov-state>
                                             <pcode-zip>N9C-3T6</pcode-zip>
                                       </addr>
                                <phone type="work">905-566-7258</phone>
                          </customerinfo>' PRESERVE WHITESPACE),?,?)@
CONNECT RESET@
