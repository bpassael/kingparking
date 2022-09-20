
require "pexels"


client = Pexels::Client.new('563492ad6f91700001000001b54f3f1f02f54ee09e3dee72764cc2f4')
p client.photos.search('Dodge Ram', orientation: "landscape", size: "small").class
p client.photos.search('Dodge Ram', orientation: "landscape", size: "small").first
