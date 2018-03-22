declare default element namespace "urn:isbn:1-931666-22-9";
(:for windows: file:///c:/Users/[username]/Desktop/[folder]/[file].xml :)
(:
1. What's the unique ID of each finding aid?
2.What's the title of each finding aid?
3.What's the number of years each finding aid covers (e.g., 1982-2000 = 18 years)?
4.What's the name of the person who encoded each finding aid?
5.How many times was each finding aid changed?
6.What's the physical extent of each finding aid?
7.In a single element per collection, could you list all of the access restrictions separated by a |?
8.In repeatable sub-elements, what are all of the indexing terms for each collection?
9.How many files are in each collection?
10.Could I see these returned from largest to smallest collection in terms of volume?:)


<findingaids>
{for $ead in collection("file:/Users/dmgustav/Desktop/xquery-assignment?select=*.xml")/ead
order by number(substring-before($ead//physdesc/extent, ' c')) descending
return 
<findingaid>
<id>{data($ead//eadid)}</id>
<title>{data($ead//titleproper)}</title>
<yearscovered>{number(substring-after($ead/eadheader/filedesc/titlestmt/titleproper/date, '-')) - number(substring-before($ead/eadheader/filedesc/titlestmt/titleproper/date, '-'))}</yearscovered>
<encodedby>{substring-after($ead/eadheader/filedesc/titlestmt/author, 'Electronic finding aid encoded by ')}</encodedby>
<changes>{count($ead//revisiondesc/change)}</changes>
<physicalextent>{data($ead//physdesc/extent)}</physicalextent>
<accessrestrictions>{string-join($ead//accessrestrict/p, '|')}</accessrestrictions>
</findingaid>
}
</findingaids>