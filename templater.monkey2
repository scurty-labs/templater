Namespace std.templater

#Import "<std>"

Using std.collections

#rem monkeydoc The Templater Class
#end
Class Templater Extends StringMap<String>
	
	Private
	
	Const StartTag:String = "{:"
	Const EndTag:String = ":}"
	
	Field Data:String
	
	Public

	Method New(data:String)
		Super.New()
		Self.Data = data
	End
	
	#rem monkeydoc Add Template Key-Value Pair A.K.A "tags"
	
	Start and end tags '{:key:}' of the `key' are automatically generated.
	The `value` added must be castable to a string.
	
	#end
	Method Add(key:String, value:Int)
		Self.Add(key, Cast<String>(value))
	End
	
	Method Add(key:String, value:Float)
		Self.Add(key, Cast<String>(value))
	End
	
	Method Add(key:String, value:Double)
		Self.Add(key, Cast<String>(value))
	End
	
	#rem monkeydoc Returns a string with new values in place of tags.
	#end
	Method Plop:String() ' Slow for larger strings; optimize later.
		For Local node := Eachin All()
			Local key:String = StartTag + node.Key + EndTag
			If( Self.Data.Contains(key) ) ' Probably not needed.
				Self.Data = Self.Data.Replace(key, node.Value)
			Endif
		Next
		Return Self.Data
	End
	
End