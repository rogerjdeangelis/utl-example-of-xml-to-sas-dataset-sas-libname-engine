Example of xml to sas dataset sas libname engine

github
https://tinyurl.com/y72nag89
https://github.com/rogerjdeangelis/utl-example-of-xml-to-sas-dataset-sas-libnam2-engine

see
https://tinyurl.com/y7c76ozy
https://communities.sas.com/t5/New-SAS-User/Convertin-multiple-XML-columns-into-a-single-SAS-data-column/m-p/500022

I made some small changes to your xml because the copy and paste seemed to
result in an invalid XML file. Note added </PEOPLE> on end.

INPUT
=====

d:/xml/simple.xml

<?xml version="1.0" encoding="UTF-8"?>
<PEOPLE xmlns:HOME="http://sample.url.org/home"
xmlns:IP="http://sample.url.org/ip"
xmlns:WORK="http://sample.url.org/work">
<PERSON>
<NAME>Joe Smith</NAME>
<HOMEADDRESS>1234 Elm Street</HOMEADDRESS>
<HOMEHONE>999-555-0011</HOMEHONE>
<WORKADDRESS>2001 Office Drive, Box 101</WORKADDRESS>
<IPADDRESS>192.168.1.1</IPADDRESS>
</PERSON>
<PERSON>
<NAME>Pat Perkinson</NAME>
<HOMEADDRESS>1395 Half Way</HOMEADDRESS>
<HOMEHONE>999-555-0103</HOMEHONE>
<WORKADDRESS>2001 Office Drive, Box 103</WORKADDRESS>
<IPADDRESS>10.0.1.1</IPADDRESS>
</PERSON>
</PEOPLE>


EXAMPLE OUTPUT
--------------

 WORK.WANT total obs=2

  PEOPLE_    PERSON_
  ORDINAL    ORDINAL        NAME           HOMEADDRESS        HOMEHONE             WORKADDRESS             IPADDRESS

     1          1       Joe Smith        1234 Elm Street    999-555-0011    2001 Office Drive, Box 101    192.168.1.1
     1          2       Pat Perkinson    1395 Half Way      999-555-0103    2001 Office Drive, Box 103    10.0.1.1

PROCESS
========

libname xml xmlv2 "d:/xml/simple.xml" automap=replace xmlmap=output;
data want ;
  set xml.person;
run;quit;
libname xml clear;


OUTPUT
======

  see above

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data _null_;
 file "d:/xml/simple.xml";
 input;
 put _infile_;
cards4;
<?xml version="1.0" encoding="UTF-8"?>
<PEOPLE xmlns:HOME="http://sample.url.org/home"
xmlns:IP="http://sample.url.org/ip"
xmlns:WORK="http://sample.url.org/work">
<PERSON>
<NAME>Joe Smith</NAME>
<HOMEADDRESS>1234 Elm Street</HOMEADDRESS>
<HOMEHONE>999-555-0011</HOMEHONE>
<WORKADDRESS>2001 Office Drive, Box 101</WORKADDRESS>
<IPADDRESS>192.168.1.1</IPADDRESS>
</PERSON>
<PERSON>
<NAME>Pat Perkinson</NAME>
<HOMEADDRESS>1395 Half Way</HOMEADDRESS>
<HOMEHONE>999-555-0103</HOMEHONE>
<WORKADDRESS>2001 Office Drive, Box 103</WORKADDRESS>
<IPADDRESS>10.0.1.1</IPADDRESS>
</PERSON>
</PEOPLE>
;;;;
run;quit;



