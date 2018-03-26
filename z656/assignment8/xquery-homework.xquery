declare default element namespace "urn:isbn:1-931666-22-9";
(:for windows: file:///c:/Users/[username]/Desktop/[folder]/[file].xml :)
(:
1. What's the unique ID of each finding aid? X
2.What's the title of each finding aid? X
3.What's the number of years each finding aid covers (e.g., 1982-2000 = 18 years)? X
4.What's the name of the person who encoded each finding aid? X
5.How many times was each finding aid changed? X
6.What's the physical extent of each finding aid? X
7.In a single element per collection, could you list all of the access restrictions separated by a |? X
8.In repeatable sub-elements, what are all of the indexing terms for each collection? X
9.How many files are in each collection?X
10.Could I see these returned from largest to smallestX collection in terms of volume?X :) 


<FindingAids>

{for $ead in collection("///E:/David/Desktop/xquery-assignment?select=*.xml")/ead
order by number(substring-before($ead//physdesc/extent, ' c')) descending
return 

<FindingAid>

<Id>{data($ead//eadid)}</Id>

<Title>{data($ead//titleproper)}</Title>

<YearsCovered>{number(substring-after($ead/eadheader/filedesc/titlestmt/titleproper/date, '-')) - number(substring-before($ead/eadheader/filedesc/titlestmt/titleproper/date, '-'))}</YearsCovered>

{if (substring-after($ead/eadheader/filedesc/titlestmt/author, 'Electronic finding aid encoded by ')!='')  then <EncodedBy>{substring-after($ead/eadheader/filedesc/titlestmt/author, 'encoded by ')}</EncodedBy> else(<EncodedBy>{substring-before(substring-after($ead/eadheader/profiledesc/creation, 'encoded by '), ',')}</EncodedBy>)}


<Changes>{count($ead//revisiondesc/change)}</Changes>

<PhysicalExtent>{data($ead//physdesc/extent)}</PhysicalExtent>

<AccessRestrictions>{string-join($ead//accessrestrict/p, '|')}</AccessRestrictions>

{<IndexingTerms> 
{for $famname in $ead//extref/persname
return <Name>{data($famname)}</Name>}

{for $persname in $ead//extref/persname
return <Name>{data($persname)}</Name>}

{for $corpname in $ead//extref/corpname
return <Name>{data($corpname)}</Name>}

{for $subjects in $ead//extref/subject
return <Subject>{data($subjects)}</Subject>}

{for $geogname in $ead//extref/geogname
return <PlaceName>{data($geogname)}</PlaceName>}

{for $title in $ead//extref/title
return <Title>{data($title)}</Title>}
</IndexingTerms>}

<FileCount>{count($ead/archdesc/dsc//*[@level='file'])}</FileCount>
</FindingAid>
}
</FindingAids>