$path = ".\simple-append-xml\input.xml"
$doc = [xml](Get-Content -Path $path)

$element1 = $doc.catalog.main.item.clone()
$test = $doc.selectnodes("//main")
$test.RemoveAll()


foreach( $g in @("1","2","3"))
{
	$element = $element1.clone()
	$element.id = "test $g" 
	$element.title = "title" 
	
	$test.AppendChild($element)
}


$doc.Save(".\simple-append-xml\output.xml")
