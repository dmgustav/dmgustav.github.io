(: In class excersises:)
(:for windows: file:///c:/Users/[username]/Desktop/[folder]/[file].xml :)


<files>
    {
        for $files in collection("file:/Users/dmgustav/Desktop/xquerypractice?select=*.xml")/root
        where some $p in $files//p satisfies (contains($p, "Brooklyn"))
        order by $files/@id ascending
        
        return
            <file>
                <id>{data($files/@id)}</id>
                <title>{data($files/title)}</title>
                <authors>{string-join($files/author, '; ')}</authors>
                <authorcount>{count($files/author)}</authorcount>
                <authorcount2>{
                        if (count($files/author) > 1) then
                            ('two')
                        else
                            ('one')
                    }</authorcount2>
                <!--<authors>{
                        for $authors in $files/author
                        return
                            <author>{data($authors)}</author>
                    }</authors> -->
            {let $elements := distinct-values($files//*/local-name())
            return <elements>{data($elements)}</elements> 
            }
            </file>
    }
</files>